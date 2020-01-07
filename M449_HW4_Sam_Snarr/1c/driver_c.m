clc; clear all; close all

hold on

dt = 2^(-2);
h = dt;

x_0 = 0;
y_0 = 3;

clear x y
qpicard
plot(x,y, '.-')
x'


clear y
RunODE45
plot(y(:,1),y(:,2), '.-')

clear y 
RunRK4
plot(y(1,:),y(2,:), 'r.-')

legend('PSM8', 'ODE45', 'RK4')

