OPENQASM 2.0;
include "qelib1.inc";
qreg q[2];
u3(-2.312919442603657,0.0,0.0) q[0];
u3(-1.8175195838283391,0.0,0.0) q[1];
u2(0.0,3.141592653589793) q[1];
cx q[0],q[1];
u2(0.0,3.141592653589793) q[1];
u3(-1.1744795852364853,0.0,0.0) q[0];
u3(0.6578340181984704,0.0,0.0) q[1];
u2(0.0,3.141592653589793) q[1];
cx q[0],q[1];
u2(0.0,3.141592653589793) q[1];
u3(0.7486402182811371,0.0,0.0) q[0];
u3(0.739156051622991,0.0,0.0) q[1];
u2(0.0,3.141592653589793) q[1];
cx q[0],q[1];
u2(0.0,3.141592653589793) q[1];
u3(0.4754939317095811,0.0,0.0) q[0];
u3(-1.5945638520487482,0.0,0.0) q[1];
