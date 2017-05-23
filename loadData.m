load('data.mat')
t=processdata.t;
q1=processdata.q1;
q2=processdata.q2
q3=processdata.v1;
q4=processdata.v2;

figure(2)
plot(t,q2,t,.05*sin(t))
legend('q2','.05*sin(t)')
grid on

