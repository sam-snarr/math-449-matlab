close all
clear all

format long
format compact

A=1;
B=1;
m=1;
f=1;
c=1;

fprintf('Running prb1_sin_CE\n')
prb1_sin_CE

hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Running prb1_sin_FE\n')
prb1_sin_FE
Cons'

%%%%%%%%%%%%%%%%%%%%%%%%%%
clear Cons
fprintf('Running prb1_sin_picard\n')
prb1_sin_picard
Cons'

%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Running prb1_sin_maclaurin\n')
prb1_sin_maclaurin
Cons'

%%%%%%%%%%%%%%%%%%%%%%%%%%

% matlab exact solution
syms y(x)
Dy = diff(y);
D2y = diff(y,2);
ode = m*D2y + f*Dy + c*y == sin(x);

conds = [y(0)==A, Dy(0)==B];
exact = matlabFunction(dsolve(ode, conds));
fplot(exact, [0 2])

%%%%%%%%%%%%%%%%%%%%%%%%

title("Approximate solutions to "+num2str(m)+"y'' + "+num2str(f)+"y' + " +num2str(c)+"y = sin(t); "+ "A = " + num2str(A) + ", B = "+num2str(B))
legend('CE', 'FE', 'Picard', 'Maclaurin', 'Exact')






