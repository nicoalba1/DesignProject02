close all;clear;clc
load('DesignProblem02_EOMs.mat');

M = symEOM.M;
C = symEOM.C;
N = symEOM.N;
tau = symEOM.tau;

syms q1 q2 v1 v2  tau1 real
q=[q1;q2;v1;v2];
qdot=[v1;v2];
T=[tau1;0];
qddot=M\(-C*qdot-N+T);
A=[0 0 1 0; 0 0 0 1;simplify(jacobian(qddot,q))];
B=[0;0;jacobian(qddot,tau1)];

A=subs(A,q1,0);
A=subs(A,q2,0);
A=subs(A,v1,0);
A=subs(A,v2,0);
A=double(A);

B=subs(B,tau1,0);
B=subs(B,q2,0);
B=double(B);

C=[0 1 0 0];
D=0;

stabililty= vpa(eig(A));

ctrb(A,B)


Q=eye(size(A));
K=lqr(A,B,Q,.01)

kRef= 1/(-C*inv(A-B*K)*B)
