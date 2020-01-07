close all
clear all

format long
format compact 

A=1;
theta_0=1;

%%%%%%%%%%%%%%%
fprintf('Running prb2_FE\n')
prb2_FE
hold on

%%%%%%%%%%%%%%%
fprintf('Running prb2_Maclaurin\n')
clearvars -except A theta_0
prb2_Maclaurin

%%%%%%%%%%%%%%%
fprintf('Running prb2_picard\n')
clearvars -except A theta_0
prb2_picard

%%%%%%%%%%%%%%%
% matlab approx
syms y(x)
Dy = diff(y);
ode = Dy == A + sin(y);

[V] = odeToVectorField(ode);

M = matlabFunction(V, 'vars', {'x', 'Y'});
sol = ode45(M,[0,10], [theta_0]);
exact = @(x)deval(sol, x, 1);

% plotting 
fplot(exact, [0,2*pi]);
title("Approximate solutions to y' = " + num2str(A)+ " + sin(y); "  +  " theta_0 = " + num2str(theta_0))
legend('FE', 'Maclaurin', 'Picard', 'exact')
xlim([0 5])