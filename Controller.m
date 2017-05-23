function func = Controller
% Do not modify this function.
func.init = @initControlSystem;
func.run = @runControlSystem;

end

% STEP #1: Modify, but do NOT rename, this function. It is called once,
% before the simulation loop starts.

function [actuators,data] = initControlSystem(sensors,references,parameters,data)

data.K=[47.6161  -36.1224   14.9294  -23.8025];
data.kRef= -19.4454;
% data.r= sin(sensors.t);
data.r= 0.3;
data.kInt=5;
data.v= 0;

[actuators,data] = runControlSystem(sensors,references,parameters,data);
end

% STEP #2: Modify, but do NOT rename, this function. It is called every
% time through the simulation loop.

function [actuators,data] = runControlSystem(sensors,references,parameters,data)

data.r=.5*sin(sensors.t)
if sensors.t<=10
    data.r=.3;
else
    data.r=0;
end

data.x=[sensors.q1; sensors.q2; sensors.v1; sensors.v2];
data.v= data.v+(sensors.q2 - data.r)*.02;

%Input: u= -K*x +kRef*r +kInt*v(t)
actuators.tau1 = -data.K*data.x +data.kRef*data.r +data.kInt*data.v;

end
