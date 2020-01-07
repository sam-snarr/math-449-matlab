
%dt = 2^(-8);

er = 1e-13; final = 10;

init = [x_0, y_0]; %[-20 0.09 0.004 0.97]; [-20 0.0892 0.0041 0.966];

optionsPF = odeset('RelTol',er,'AbsTol',[er]);

[t,y] = ode45(@(t,y)ODE45Flame(t,y),[0:dt:final+dt],init,optionsPF);

%plot(y(:,1), y(:,2))
           
