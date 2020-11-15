# -*- coding: utf-8 -*-

# (C) Copyright Ji Liu and Luciano Bello 2020.
#
# This code is licensed under the Apache License, Version 2.0. You may
# obtain a copy of this license in the LICENSE.txt file in the root directory
# of this source tree or at http://www.apache.org/licenses/LICENSE-2.0.
#
# Any modifications or derivative works of this code must retain this
# copyright notice, and modified files need to carry a notice indicating
# that they have been altered from the originals.

"""Decompose SWAPs into 2 CXs when pure state."""

import numpy as np
import math

from qiskit.transpiler.exceptions import TranspilerError
from qiskit.transpiler.basepasses import TransformationPass
from qiskit.extensions.standard import XGate, SwapGate, YGate, ZGate, SGate, TGate, SdgGate, \
    TdgGate, HGate, ZGate, CzGate, U1Gate, U2Gate, U3Gate, RXGate, RYGate, RZGate

from qiskit.circuit import ControlledGate, Reset
from qiskit.dagcircuit import DAGCircuit
from .aswap_gate import ASwapGate
from qiskit.circuit import QuantumRegister, ControlledGate, Reset

from qiskit.quantum_info.operators import Quaternion

_CHOP_THRESHOLD = 1e-15


class PureStateOptimization(TransformationPass):
    single_gates = (XGate, YGate, ZGate, HGate, SGate, SdgGate, TGate, TdgGate, RXGate, RYGate, RZGate, U1Gate, U2Gate, U3Gate)
    def __init__(self):
        self.wire_state = None
        super().__init__()
    def run(self, dag):
        """Run the PureStateOptimization pass on `dag`.

        Args:
            dag (DAGCircuit): DAG with swaps.

        Returns:
            DAGCircuit: DAG without some swaps.
        """
        self.wire_state = WireStatus(dag.qubits())

        for node in dag.topological_op_nodes():
            if isinstance(node.op, ControlledGate):
                for qarg in node.qargs:
                    self.wire_state[qarg] = None
            elif isinstance(node.op, SwapGate):
                if self.wire_state.swap_can_be_removed(node.qargs[0], node.qargs[1]):
                    dag.remove_op_node(node)
                    continue
                which_swap = self.wire_state.swap_can_be_replaced(node.qargs[0], node.qargs[1])
                if which_swap == 'both':
                    new_dag = PureStateOptimization.swap_to_u_dag(self.wire_state, node.qargs[0], node.qargs[1])
                    dag.substitute_node_with_dag(node, new_dag)
                    # update wire_status:
                    self.wire_state.swap_states(node.qargs[0], node.qargs[1])
                elif which_swap in ['left', 'right']:
                    new_dag = PureStateOptimization.ASwapGate(which_swap, self.wire_state, node.qargs[0], node.qargs[1])
                    dag.substitute_node_with_dag(node, new_dag)
                    self.wire_state.swap_states(node.qargs[0], node.qargs[1])
                else:
                    self.wire_state.swap_states(node.qargs[0], node.qargs[1])
                    continue
            elif isinstance(node.op, self.single_gates):
                PureStateOptimization.single_gates_wire_status(self.wire_state, node)
                continue
            else:
                # Any other state is not constant
                for qarg in node.qargs:
                    self.wire_state[qarg] = None
        return dag



    @staticmethod
    def swap_dag(swap_gate, qubit1, qubit2):
        new_dag = DAGCircuit()
        for qreg in set([qubit1.register, qubit2.register]):
            new_dag.add_qreg(qreg)
        new_dag.apply_operation_back(swap_gate(), [qubit1, qubit2])
        return new_dag

    @staticmethod
    def swap_x_dag(swap_gate, which_swap):
        new_dag = DAGCircuit()
        reg = QuantumRegister(2)
        new_dag.add_qreg(reg)
        if which_swap == 'left':
            regList = [reg[0], reg[1]]
        elif which_swap == 'right':
            regList = [reg[1], reg[0]]
        else:
            raise TranspilerError('Unexpected direction of swap gate')
        new_dag.apply_operation_back(XGate(), [regList[1]])
        new_dag.apply_operation_back(swap_gate(), regList)
        return new_dag

    @staticmethod
    def swap_z_dag(swap_gate, which_swap):
        new_dag = DAGCircuit()
        reg = QuantumRegister(2)
        new_dag.add_qreg(reg)
        if which_swap == 'left':
            regList = [reg[1], reg[0]]
        elif which_swap == 'right':
            regList = [reg[0], reg[1]]
        else:
            raise TranspilerError('Unexpected direction of swap gate')
        new_dag.apply_operation_back(ZGate(), [regList[0]])
        new_dag.apply_operation_back(swap_gate(), regList)
        return new_dag

    @staticmethod
    def swap_u_dag(aswap_gate, params, which_swap):
        new_dag = DAGCircuit()
        reg = QuantumRegister(2)
        new_dag.add_qreg(reg)
        if which_swap == 'left':
            regList = [reg[0], reg[1]]
        elif which_swap == 'right':
            regList = [reg[1], reg[0]]
        else:
            raise TranspilerError('Unexpected direction of swap gate')
        new_dag.apply_operation_back(U3Gate(-params[0], -params[2], -params[1]), [regList[0]])
        new_dag.apply_operation_back(aswap_gate(), regList)
        new_dag.apply_operation_back(U3Gate(params[0], params[1], params[2]), [regList[1]])
        return new_dag


    @staticmethod
    def ASwapGate(which_swap, wire_state, qubit1, qubit2):
        if which_swap == 'left':
            if wire_state.check_Zero_state(qubit1):
                return PureStateOptimization.swap_dag(ASwapGate, qubit1, qubit2)
            elif wire_state.check_One_state(qubit1):
                return PureStateOptimization.swap_x_dag(ASwapGate, which_swap)
            elif wire_state.check_Plus_state(qubit1):
                return PureStateOptimization.swap_dag(ASwapGate, qubit2, qubit1)
            elif wire_state.check_Minus_state(qubit1):
                return PureStateOptimization.swap_z_dag(ASwapGate, which_swap)
            else:
                return PureStateOptimization.swap_u_dag(ASwapGate, wire_state[qubit1], which_swap)
        if which_swap == 'right':
            if wire_state.check_Zero_state(qubit2):
                return PureStateOptimization.swap_dag(ASwapGate, qubit2, qubit1)
            elif wire_state.check_One_state(qubit2):
                return PureStateOptimization.swap_x_dag(ASwapGate, which_swap)
            elif wire_state.check_Plus_state(qubit2):
                return PureStateOptimization.swap_dag(ASwapGate, qubit1, qubit2)
            elif wire_state.check_Minus_state(qubit2):
                return PureStateOptimization.swap_z_dag(ASwapGate, which_swap)
            else:
                return PureStateOptimization.swap_u_dag(ASwapGate, wire_state[qubit2], which_swap)

    @staticmethod
    def single_gates_wire_status(wire_state, node):
        if wire_state[node.qargs[0]] is None:
            return
        if isinstance(node.op, XGate):
            wire_state.u3(node.qargs[0], [np.pi, 0, np.pi])
        elif isinstance(node.op, YGate):
            wire_state.u3(node.qargs[0], [np.pi, np.pi / 2, np.pi / 2])
        elif isinstance(node.op, ZGate):
            wire_state.u1(node.qargs[0], [np.pi])
        elif isinstance(node.op, HGate):
            wire_state.u2(node.qargs[0], [0, np.pi])
        elif isinstance(node.op, SGate):
            wire_state.u1(node.qargs[0], [np.pi / 2])
        elif isinstance(node.op, SdgGate):
            wire_state.u1(node.qargs[0], [3 * np.pi / 2])
        elif isinstance(node.op, TGate):
            wire_state.u1(node.qargs[0], [np.pi / 4])
        elif isinstance(node.op, TdgGate):
            wire_state.u1(node.qargs[0], [7 * np.pi / 4])
        elif isinstance(node.op, RXGate):
            wire_state.u3(node.qargs[0], [node.op.params[0], 3 * np.pi / 2, np.pi / 2])
        elif isinstance(node.op, RYGate):
            wire_state.u3(node.qargs[0], [node.op.params[0], 0, 0])
        elif isinstance(node.op, RZGate):
            wire_state.u1(node.qargs[0], [node.op.params[0]])
        elif isinstance(node.op, U1Gate):
            wire_state.u1(node.qargs[0], node.op.params)
        elif isinstance(node.op, U2Gate):
            wire_state.u2(node.qargs[0], node.op.params)
        elif isinstance(node.op, U3Gate):
            wire_state.u3(node.qargs[0], node.op.params)
        else:
            raise TranspilerError('Unexpected single qubit gate')

    @staticmethod
    def swap_to_u_dag(wire_status, qubit1, qubit2):
        new_dag = DAGCircuit()
        reg = QuantumRegister(2)
        new_dag.add_qreg(reg)

        #TODO: This part can be optimized by selecting u1 and u2 gate rather than using u3 gate.
        theta1, phi1, lambda1 = WireStatus.u3_to_u3(wire_status[qubit1], wire_status[qubit2])
        theta2, phi2, lambda2 = WireStatus.u3_to_u3(wire_status[qubit2], wire_status[qubit1])
        op1 = U3Gate(theta1, phi1, lambda1)
        op2 = U3Gate(theta2, phi2, lambda2)
        new_dag.apply_operation_back(op1, [reg[0]])
        new_dag.apply_operation_back(op2, [reg[1]])
        return new_dag

class WireStatus():
    """
        wire_state represented by [theta, phi, lambda], where 0 <= theta <= pi, 0 <= phi < 2*pi, 0 <= lambda < 2*pi
        #U3(theta, phi, lambda) = Rz(phi)*Ry(theta)*Rz(lambda), the rotating order is from right to left, Rz(lambda) rotation first
        |0> state: [0, arb, arb], |1> state: [pi, arb, arb],
        |+> state: [pi/2, 0, arb], |-> state:[pi/2, pi, arb ],
        |i> state: [pi/2, pi/2, arb], |-i> state:[pi/2, 3pi/2, arb],
        TODO: these three parameters can be simplified to two parameters?
    """
    def __init__(self, qubits):
        self._dict = {qubit: [0, 0, 0] for qubit in qubits}

    def __setitem__(self, key, item):
        self._dict[key] = item

    def __getitem__(self, key):
        return self._dict[key]

    def __repr__(self):
        return repr(self._dict)

    # def flip(self, qubit):
        #change phase, to do

    def swap(self, qubit1, qubit2):
        self._dict[qubit1], self._dict[qubit2] = self._dict[qubit2], self._dict[qubit1]

    def swap_can_be_removed(self, qubit1, qubit2):
        return self._dict[qubit1] == self._dict[qubit2]

    def swap_can_be_replaced(self, qubit1, qubit2):
        if self._dict[qubit1] is not None and self._dict[qubit2] is not None:
            swap_id = 'both'
        elif self._dict[qubit1] is not None:
            swap_id = 'left'
        elif self._dict[qubit2] is not None:
            swap_id = 'right'
        else:
            swap_id = None
        return swap_id

    def swap_states(self, qubit1, qubit2):
        self._dict[qubit1], self._dict[qubit2] = self._dict[qubit2], self._dict[qubit1]

    def u1(self, qubit, parameters):
        WireStatus.u3(self, qubit, [0, 0, parameters[0]])

    def u2(self, qubit, parameters):
        WireStatus.u3(self, qubit, [np.pi/2, parameters[0], parameters[1]])

    def u3(self, qubit, parameters):
        theta1 = parameters[0]
        phi1 = parameters[1]
        lambda1 = parameters[2]
        theta2 = self._dict[qubit][0]
        phi2 = self._dict[qubit][1]
        lambda2 = self._dict[qubit][2]
        thetap, phip, lambdap = WireStatus.yzy_to_zyz((lambda1 + phi2), theta1, theta2)
        self._dict[qubit][0], self._dict[qubit][1], self._dict[qubit][2] = WireStatus.round_to_half_pi(thetap, phi1 + phip, lambda2 + lambdap)

    def check_Zero_state(self, qubit):
        if self._dict[qubit] is None:
            return False
        elif np.isclose(self._dict[qubit][0], 0):
            return True
        else:
            return False

    def check_One_state(self, qubit):
        if self._dict[qubit] is None:
            return False
        elif np.isclose(self._dict[qubit][0], np.pi):
            return True
        else:
            return False

    def check_Plus_state(self, qubit):
        if self._dict[qubit] is None:
            return False
        elif np.isclose(self._dict[qubit][0], np.pi/2) and np.isclose(self._dict[qubit][1], 0):
            return True
        else:
            return False

    def check_Minus_state(self, qubit):
        if self._dict[qubit] is None:
            return False
        elif np.isclose(self._dict[qubit][0], np.pi/2) and np.isclose(self._dict[qubit][1], np.pi):
            return True
        else:
            return False

    # def check_None_state(self, qubit):
    #     if self._dict[qubit][0] == None or self._dict[qubit][1] == None or self._dict[qubit][2] == None:
    #         return True
    #     else:
    #         return False

    @staticmethod
    def u3_to_u3(parameters1, parameters2):
        #finding the corresponding u3 gate than will change the wire_state from parameters1 to parameters2.
        theta2 = -parameters1[0]
        phi2 = -parameters1[2]
        lambda2 = -parameters1[1]
        theta1 = parameters2[0]
        phi1 = parameters2[1]
        lambda1 = parameters2[2]
        thetap, phip, lambdap = WireStatus.yzy_to_zyz((lambda1 + phi2), theta1, theta2)
        thetar, phir, lambdar = WireStatus.round_to_half_pi(thetap, phi1 + phip, lambda2 + lambdap)
        return thetar, phir, lambdar


    @staticmethod
    def yzy_to_zyz(xi, theta1, theta2, eps=1e-9):  # pylint: disable=invalid-name
        """Express a Y.Z.Y single qubit gate as a Z.Y.Z gate.

        Solve the equation

        .. math::

        Ry(theta1).Rz(xi).Ry(theta2) = Rz(phi).Ry(theta).Rz(lambda)

        for theta, phi, and lambda.

        Return a solution theta, phi, and lambda.
        """
        Quaternion_yzy = Quaternion.from_euler([theta1, xi, theta2], 'yzy')
        euler = Quaternion_yzy.to_zyz()
        Quaternion_zyz = Quaternion.from_euler(euler, 'zyz')
        # output order different than rotation order
        out_angles = (euler[1], euler[0], euler[2])
        abs_inner = abs(Quaternion_zyz.data.dot(Quaternion_yzy.data))
        if not np.allclose(abs_inner, 1, eps):
            raise TranspilerError('YZY and ZYZ angles do not give same rotation matrix.')
        out_angles = tuple(0 if np.abs(angle) < _CHOP_THRESHOLD else angle
                           for angle in out_angles)
        return out_angles

    @staticmethod
    def round_to_half_pi(thetar, phir, lambdar):
        if thetar > np.pi:
            raise TranspilerError('Unexpected theta value')
        # phir = phir % (2 * np.pi)
        # lambdar = lambdar % (2 * np.pi)
        if abs(math.fmod(thetar, np.pi/2)) < _CHOP_THRESHOLD:
            thetar = int(round(thetar/(np.pi/2))) * np.pi/2
        if abs(math.fmod(phir, np.pi/2)) < _CHOP_THRESHOLD:
            phir = int(round(phir/(np.pi/2))) * np.pi/2
        if abs(math.fmod(lambdar, np.pi/2)) < _CHOP_THRESHOLD:
            lambdar = int(round(lambdar/(np.pi/2))) * np.pi/2
        phir = phir % (2 * np.pi)
        lambdar = lambdar % (2 * np.pi)
        return thetar, phir, lambdar
