OPENQASM 2.0;
include "qelib1.inc";
qreg q[12];
u3(-1.5707870958734564,0.0,0.0) q[0];
u3(-1.5708092027270129,0.0,0.0) q[1];
u3(-1.5713065220972429,0.0,0.0) q[2];
u3(1.5704396581746747,0.0,0.0) q[3];
u3(1.5689970424409136,0.0,0.0) q[4];
u3(1.569500592570128,0.0,0.0) q[5];
u3(1.5708971602573898,0.0,0.0) q[6];
u3(-1.6774255791356336,0.0,0.0) q[7];
u3(2.478670696118468,0.0,0.0) q[8];
u3(0.12051640240349597,0.0,0.0) q[9];
u3(0.02129289121126454,0.0,0.0) q[10];
u3(-3.1220571581284284,0.0,0.0) q[11];
u2(0.0,3.141592653589793) q[1];
cx q[0],q[1];
u2(0.0,3.141592653589793) q[1];
u2(0.0,3.141592653589793) q[2];
cx q[0],q[2];
u2(0.0,3.141592653589793) q[2];
u2(0.0,3.141592653589793) q[3];
cx q[0],q[3];
u2(0.0,3.141592653589793) q[3];
u2(0.0,3.141592653589793) q[4];
cx q[0],q[4];
u2(0.0,3.141592653589793) q[4];
u2(0.0,3.141592653589793) q[5];
cx q[0],q[5];
u2(0.0,3.141592653589793) q[5];
u2(0.0,3.141592653589793) q[6];
cx q[0],q[6];
u2(0.0,3.141592653589793) q[6];
u2(0.0,3.141592653589793) q[7];
cx q[0],q[7];
u2(0.0,3.141592653589793) q[7];
u2(0.0,3.141592653589793) q[8];
cx q[0],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[0],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[0],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[0],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[2];
cx q[1],q[2];
u2(0.0,3.141592653589793) q[2];
u2(0.0,3.141592653589793) q[3];
cx q[1],q[3];
u2(0.0,3.141592653589793) q[3];
u2(0.0,3.141592653589793) q[4];
cx q[1],q[4];
u2(0.0,3.141592653589793) q[4];
u2(0.0,3.141592653589793) q[5];
cx q[1],q[5];
u2(0.0,3.141592653589793) q[5];
u2(0.0,3.141592653589793) q[6];
cx q[1],q[6];
u2(0.0,3.141592653589793) q[6];
u2(0.0,3.141592653589793) q[7];
cx q[1],q[7];
u2(0.0,3.141592653589793) q[7];
u2(0.0,3.141592653589793) q[8];
cx q[1],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[1],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[1],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[1],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[3];
cx q[2],q[3];
u2(0.0,3.141592653589793) q[3];
u2(0.0,3.141592653589793) q[4];
cx q[2],q[4];
u2(0.0,3.141592653589793) q[4];
u2(0.0,3.141592653589793) q[5];
cx q[2],q[5];
u2(0.0,3.141592653589793) q[5];
u2(0.0,3.141592653589793) q[6];
cx q[2],q[6];
u2(0.0,3.141592653589793) q[6];
u2(0.0,3.141592653589793) q[7];
cx q[2],q[7];
u2(0.0,3.141592653589793) q[7];
u2(0.0,3.141592653589793) q[8];
cx q[2],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[2],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[2],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[2],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[4];
cx q[3],q[4];
u2(0.0,3.141592653589793) q[4];
u2(0.0,3.141592653589793) q[5];
cx q[3],q[5];
u2(0.0,3.141592653589793) q[5];
u2(0.0,3.141592653589793) q[6];
cx q[3],q[6];
u2(0.0,3.141592653589793) q[6];
u2(0.0,3.141592653589793) q[7];
cx q[3],q[7];
u2(0.0,3.141592653589793) q[7];
u2(0.0,3.141592653589793) q[8];
cx q[3],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[3],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[3],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[3],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[5];
cx q[4],q[5];
u2(0.0,3.141592653589793) q[5];
u2(0.0,3.141592653589793) q[6];
cx q[4],q[6];
u2(0.0,3.141592653589793) q[6];
u2(0.0,3.141592653589793) q[7];
cx q[4],q[7];
u2(0.0,3.141592653589793) q[7];
u2(0.0,3.141592653589793) q[8];
cx q[4],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[4],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[4],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[4],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[6];
cx q[5],q[6];
u2(0.0,3.141592653589793) q[6];
u2(0.0,3.141592653589793) q[7];
cx q[5],q[7];
u2(0.0,3.141592653589793) q[7];
u2(0.0,3.141592653589793) q[8];
cx q[5],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[5],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[5],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[5],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[7];
cx q[6],q[7];
u2(0.0,3.141592653589793) q[7];
u2(0.0,3.141592653589793) q[8];
cx q[6],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[6],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[6],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[6],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[8];
cx q[7],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[7],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[7],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[7],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[9];
cx q[8],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[8],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[8],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[10];
cx q[9],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[9],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[11];
cx q[10],q[11];
u2(0.0,3.141592653589793) q[11];
u3(-1.227660827706958,0.0,0.0) q[0];
u3(1.0199995939555404,0.0,0.0) q[1];
u3(-2.4221695555450435,0.0,0.0) q[2];
u3(2.648720417492631,0.0,0.0) q[3];
u3(0.38373849293669354,0.0,0.0) q[4];
u3(2.8257331054320667,0.0,0.0) q[5];
u3(-2.19754749722013,0.0,0.0) q[6];
u3(0.007367544114312327,0.0,0.0) q[7];
u3(-7.82825766546278e-05,0.0,0.0) q[8];
u3(3.141592653589793,0.0,0.0) q[9];
u3(-3.141592653589793,0.0,0.0) q[10];
u3(4.914894205485792e-05,0.0,0.0) q[11];
u2(0.0,3.141592653589793) q[1];
cx q[0],q[1];
u2(0.0,3.141592653589793) q[1];
u2(0.0,3.141592653589793) q[2];
cx q[0],q[2];
u2(0.0,3.141592653589793) q[2];
u2(0.0,3.141592653589793) q[3];
cx q[0],q[3];
u2(0.0,3.141592653589793) q[3];
u2(0.0,3.141592653589793) q[4];
cx q[0],q[4];
u2(0.0,3.141592653589793) q[4];
u2(0.0,3.141592653589793) q[5];
cx q[0],q[5];
u2(0.0,3.141592653589793) q[5];
u2(0.0,3.141592653589793) q[6];
cx q[0],q[6];
u2(0.0,3.141592653589793) q[6];
u2(0.0,3.141592653589793) q[7];
cx q[0],q[7];
u2(0.0,3.141592653589793) q[7];
u2(0.0,3.141592653589793) q[8];
cx q[0],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[0],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[0],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[0],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[2];
cx q[1],q[2];
u2(0.0,3.141592653589793) q[2];
u2(0.0,3.141592653589793) q[3];
cx q[1],q[3];
u2(0.0,3.141592653589793) q[3];
u2(0.0,3.141592653589793) q[4];
cx q[1],q[4];
u2(0.0,3.141592653589793) q[4];
u2(0.0,3.141592653589793) q[5];
cx q[1],q[5];
u2(0.0,3.141592653589793) q[5];
u2(0.0,3.141592653589793) q[6];
cx q[1],q[6];
u2(0.0,3.141592653589793) q[6];
u2(0.0,3.141592653589793) q[7];
cx q[1],q[7];
u2(0.0,3.141592653589793) q[7];
u2(0.0,3.141592653589793) q[8];
cx q[1],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[1],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[1],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[1],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[3];
cx q[2],q[3];
u2(0.0,3.141592653589793) q[3];
u2(0.0,3.141592653589793) q[4];
cx q[2],q[4];
u2(0.0,3.141592653589793) q[4];
u2(0.0,3.141592653589793) q[5];
cx q[2],q[5];
u2(0.0,3.141592653589793) q[5];
u2(0.0,3.141592653589793) q[6];
cx q[2],q[6];
u2(0.0,3.141592653589793) q[6];
u2(0.0,3.141592653589793) q[7];
cx q[2],q[7];
u2(0.0,3.141592653589793) q[7];
u2(0.0,3.141592653589793) q[8];
cx q[2],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[2],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[2],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[2],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[4];
cx q[3],q[4];
u2(0.0,3.141592653589793) q[4];
u2(0.0,3.141592653589793) q[5];
cx q[3],q[5];
u2(0.0,3.141592653589793) q[5];
u2(0.0,3.141592653589793) q[6];
cx q[3],q[6];
u2(0.0,3.141592653589793) q[6];
u2(0.0,3.141592653589793) q[7];
cx q[3],q[7];
u2(0.0,3.141592653589793) q[7];
u2(0.0,3.141592653589793) q[8];
cx q[3],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[3],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[3],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[3],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[5];
cx q[4],q[5];
u2(0.0,3.141592653589793) q[5];
u2(0.0,3.141592653589793) q[6];
cx q[4],q[6];
u2(0.0,3.141592653589793) q[6];
u2(0.0,3.141592653589793) q[7];
cx q[4],q[7];
u2(0.0,3.141592653589793) q[7];
u2(0.0,3.141592653589793) q[8];
cx q[4],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[4],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[4],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[4],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[6];
cx q[5],q[6];
u2(0.0,3.141592653589793) q[6];
u2(0.0,3.141592653589793) q[7];
cx q[5],q[7];
u2(0.0,3.141592653589793) q[7];
u2(0.0,3.141592653589793) q[8];
cx q[5],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[5],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[5],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[5],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[7];
cx q[6],q[7];
u2(0.0,3.141592653589793) q[7];
u2(0.0,3.141592653589793) q[8];
cx q[6],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[6],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[6],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[6],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[8];
cx q[7],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[7],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[7],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[7],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[9];
cx q[8],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[8],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[8],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[10];
cx q[9],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[9],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[11];
cx q[10],q[11];
u2(0.0,3.141592653589793) q[11];
u3(1.5707529501791566,0.0,0.0) q[0];
u3(1.5708061624618226,0.0,0.0) q[1];
u3(-1.5713124672767946,0.0,0.0) q[2];
u3(1.570437990122923,0.0,0.0) q[3];
u3(-1.5689919604393938,0.0,0.0) q[4];
u3(-1.5721067655832701,0.0,0.0) q[5];
u3(1.5708468434120453,0.0,0.0) q[6];
u3(1.6774984790208805,0.0,0.0) q[7];
u3(0.6629843866667994,0.0,0.0) q[8];
u3(-1.379010504085242,0.0,0.0) q[9];
u3(0.02129834225873652,0.0,0.0) q[10];
u3(-0.019538498895392685,0.0,0.0) q[11];
u2(0.0,3.141592653589793) q[1];
cx q[0],q[1];
u2(0.0,3.141592653589793) q[1];
u2(0.0,3.141592653589793) q[2];
cx q[0],q[2];
u2(0.0,3.141592653589793) q[2];
u2(0.0,3.141592653589793) q[3];
cx q[0],q[3];
u2(0.0,3.141592653589793) q[3];
u2(0.0,3.141592653589793) q[4];
cx q[0],q[4];
u2(0.0,3.141592653589793) q[4];
u2(0.0,3.141592653589793) q[5];
cx q[0],q[5];
u2(0.0,3.141592653589793) q[5];
u2(0.0,3.141592653589793) q[6];
cx q[0],q[6];
u2(0.0,3.141592653589793) q[6];
u2(0.0,3.141592653589793) q[7];
cx q[0],q[7];
u2(0.0,3.141592653589793) q[7];
u2(0.0,3.141592653589793) q[8];
cx q[0],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[0],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[0],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[0],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[2];
cx q[1],q[2];
u2(0.0,3.141592653589793) q[2];
u2(0.0,3.141592653589793) q[3];
cx q[1],q[3];
u2(0.0,3.141592653589793) q[3];
u2(0.0,3.141592653589793) q[4];
cx q[1],q[4];
u2(0.0,3.141592653589793) q[4];
u2(0.0,3.141592653589793) q[5];
cx q[1],q[5];
u2(0.0,3.141592653589793) q[5];
u2(0.0,3.141592653589793) q[6];
cx q[1],q[6];
u2(0.0,3.141592653589793) q[6];
u2(0.0,3.141592653589793) q[7];
cx q[1],q[7];
u2(0.0,3.141592653589793) q[7];
u2(0.0,3.141592653589793) q[8];
cx q[1],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[1],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[1],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[1],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[3];
cx q[2],q[3];
u2(0.0,3.141592653589793) q[3];
u2(0.0,3.141592653589793) q[4];
cx q[2],q[4];
u2(0.0,3.141592653589793) q[4];
u2(0.0,3.141592653589793) q[5];
cx q[2],q[5];
u2(0.0,3.141592653589793) q[5];
u2(0.0,3.141592653589793) q[6];
cx q[2],q[6];
u2(0.0,3.141592653589793) q[6];
u2(0.0,3.141592653589793) q[7];
cx q[2],q[7];
u2(0.0,3.141592653589793) q[7];
u2(0.0,3.141592653589793) q[8];
cx q[2],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[2],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[2],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[2],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[4];
cx q[3],q[4];
u2(0.0,3.141592653589793) q[4];
u2(0.0,3.141592653589793) q[5];
cx q[3],q[5];
u2(0.0,3.141592653589793) q[5];
u2(0.0,3.141592653589793) q[6];
cx q[3],q[6];
u2(0.0,3.141592653589793) q[6];
u2(0.0,3.141592653589793) q[7];
cx q[3],q[7];
u2(0.0,3.141592653589793) q[7];
u2(0.0,3.141592653589793) q[8];
cx q[3],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[3],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[3],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[3],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[5];
cx q[4],q[5];
u2(0.0,3.141592653589793) q[5];
u2(0.0,3.141592653589793) q[6];
cx q[4],q[6];
u2(0.0,3.141592653589793) q[6];
u2(0.0,3.141592653589793) q[7];
cx q[4],q[7];
u2(0.0,3.141592653589793) q[7];
u2(0.0,3.141592653589793) q[8];
cx q[4],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[4],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[4],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[4],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[6];
cx q[5],q[6];
u2(0.0,3.141592653589793) q[6];
u2(0.0,3.141592653589793) q[7];
cx q[5],q[7];
u2(0.0,3.141592653589793) q[7];
u2(0.0,3.141592653589793) q[8];
cx q[5],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[5],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[5],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[5],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[7];
cx q[6],q[7];
u2(0.0,3.141592653589793) q[7];
u2(0.0,3.141592653589793) q[8];
cx q[6],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[6],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[6],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[6],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[8];
cx q[7],q[8];
u2(0.0,3.141592653589793) q[8];
u2(0.0,3.141592653589793) q[9];
cx q[7],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[7],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[7],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[9];
cx q[8],q[9];
u2(0.0,3.141592653589793) q[9];
u2(0.0,3.141592653589793) q[10];
cx q[8],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[8],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[10];
cx q[9],q[10];
u2(0.0,3.141592653589793) q[10];
u2(0.0,3.141592653589793) q[11];
cx q[9],q[11];
u2(0.0,3.141592653589793) q[11];
u2(0.0,3.141592653589793) q[11];
cx q[10],q[11];
u2(0.0,3.141592653589793) q[11];
u3(-1.6932077908405225e-05,0.0,0.0) q[0];
u3(-3.141592653589793,0.0,0.0) q[1];
u3(0.0001504291872957998,0.0,0.0) q[2];
u3(-3.141521009079815,0.0,0.0) q[3];
u3(0.00011625705499062832,0.0,0.0) q[4];
u3(3.1414532296158333,0.0,0.0) q[5];
u3(-1.592374858198629e-05,0.0,0.0) q[6];
u3(-1.533194035862765e-05,0.0,0.0) q[7];
u3(3.1415855838360147,0.0,0.0) q[8];
u3(1.4995186713038005,0.0,0.0) q[9];
u3(3.803615748036557e-05,0.0,0.0) q[10];
u3(3.1415926684909543,0.0,0.0) q[11];
