close all
clear all

format long
format compact

A=1;
B=1;

m=1;
f=0;
c=1;

%%%%%%%%%%%%%%
fprintf('Running prb1_tan_CE\n')
prb1_tan_CE
hold on

%%%%%%%%%%%%%%%%%%%%
fprintf('Running prb1_tan_FE\n')
prb1_tan_FE
Cons'

%%%%%%%%%%%%%%%%%%%%
fprintf('Running prb1_tan_picard\n')
prb1_tan_picard
Cons'

%%%%%%%%%%%%%%%%%%%%%%
fprintf('Running prb1_tan_maclaurin\n')
prb1_tan_maclaurin
Cons'

%%%%%% matlab approximation
syms y(x)
Dy = diff(y);
D2y = diff(y,2);
ode = m*D2y + f*Dy + c*y == tan(x);

[V] = odeToVectorField(ode);

M = matlabFunction(V, 'vars', {'x', 'Y'});
sol = ode45(M,[0,10], [A B]);
exact = @(x)deval(sol, x, 1);
hold on
fplot(exact, [0 5])

%%%%%%%%%%%%%%%%%%%%%%%
title("Approximate solutions to "+num2str(m)+"y'' + "+num2str(f)+"y' + " +num2str(c)+"y = tan(t); "+ "A = " + num2str(A) + ", B = "+num2str(B))
legend('CE', 'FE', 'Picard', 'Maclaurin', 'Exact')




