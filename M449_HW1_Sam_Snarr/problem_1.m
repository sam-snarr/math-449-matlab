% Problem 1

close all
clear all
clc

%%%%%%%%%%%%%%%% 1a
w_4 = @(t) 1 + 10*t + 100/2*t.^2 + 1000/6*t.^3 + 10000/24*t.^4;
w_5 = @(t) 1 + 10*t + 100/2*t.^2 + 1000/6*t.^3 + 10000/24*t.^4 + 100000/120*t.^5;
exact = @(t) exp(10*t);

% 0 to 0.25
fplot(w_4, [0, 0.25])
hold on
fplot(w_5, [0, 0.25])
fplot(exact, [0, 0.25])
legend('4th degree', '5th degree', 'exact')
title("1a) $x'=10x$ Maclaurin Polynomials over [0, 0.25]", 'interpreter', 'latex')
pause()

% 0 to 0.25 error
figure
p = linspace(0, 0.25, 1000);
plot(p, abs(w_4(p)-exact(p))./exact(p), p, abs(w_5(p)-exact(p))./exact(p))
legend('4th degree', '5th degree')
title("1a) $x'=10x$ Relative Error over [0, 0.25]", 'interpreter', 'latex')
pause 

% 0 to 0.5
figure
fplot(w_4, [0, 0.5])
hold on
fplot(w_5, [0, 0.5])
fplot(exact, [0, 0.5])
legend('4th degree', '5th degree', 'exact')
title("1a) $x'=10x$ Maclaurin Polynomials over [0, 0.5]", 'interpreter', 'latex')
pause()

% 0 to 0.5 error
figure
p = linspace(0, 0.5, 1000);
plot(p, abs(w_4(p)-exact(p))./exact(p), p, abs(w_5(p)-exact(p))./exact(p))
legend('4th degree', '5th degree')
title("1a) $x'=10x$ Relative Error over [0, 0.5]", 'interpreter', 'latex')
pause 

% 0 to 1
figure
fplot(w_4, [0, 1])
hold on
fplot(w_5, [0, 1])
fplot(exact, [0, 1])
legend('4th degree', '5th degree', 'exact')
title("1a) $x'=10x$ Maclaurin Polynomials over [0, 1]", 'interpreter', 'latex')
pause()

% 0 to 1 error
figure
p = linspace(0, 1, 1000);
plot(p, abs(w_4(p)-exact(p))./exact(p), p, abs(w_5(p)-exact(p))./exact(p))
legend('4th degree', '5th degree')
title("1a) $x'=10x$ Relative Error over [0, 1]", 'interpreter', 'latex')
pause 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%% 1b
w_4 = @(t) 1 - 10*t + 100/2*t.^2 - 1000/6*t.^3 + 10000/24*t.^4;
w_5 = @(t) 1 - 10*t + 100/2*t.^2 - 1000/6*t.^3 + 10000/24*t.^4 - 100000/120*t.^5;
exact = @(t) exp(-10*t);

% 0 to 0.25
figure
fplot(w_4, [0, 0.25])
hold on
fplot(w_5, [0, 0.25])
fplot(exact, [0, 0.25])
legend('4th degree', '5th degree', 'exact')
title("1b) $x'=-10x$ Maclaurin Polynomials over [0, 0.25]", 'interpreter', 'latex')
pause()

% 0 to 0.25 error
figure
p = linspace(0, 0.25, 1000);
plot(p, abs(w_4(p)-exact(p))./exact(p), p, abs(w_5(p)-exact(p))./exact(p))
legend('4th degree', '5th degree')
title("1b) $x'=-10x$ Relative Error over [0, 0.25]", 'interpreter', 'latex')
pause 

% 0 to 0.5
figure
fplot(w_4, [0, 0.5])
hold on
fplot(w_5, [0, 0.5])
fplot(exact, [0, 0.5])
legend('4th degree', '5th degree', 'exact')
title("1b) $x'=-10x$ Maclaurin Polynomials over [0, 0.5]", 'interpreter', 'latex')
pause()

% 0 to 0.5 error
figure
p = linspace(0, 0.5, 1000);
plot(p, abs(w_4(p)-exact(p))./exact(p), p, abs(w_5(p)-exact(p))./exact(p))
legend('4th degree', '5th degree')
title("1b) $x'=-10x$ Relative Error over [0, 0.5]", 'interpreter', 'latex')
pause 

% 0 to 1
figure
fplot(w_4, [0, 1])
hold on
fplot(w_5, [0, 1])
fplot(exact, [0, 1])
legend('4th degree', '5th degree', 'exact')
title("1b) $x'=-10x$ Maclaurin Polynomials over [0, 1]", 'interpreter', 'latex')

% 0 to 1 error
figure
p = linspace(0, 1, 1000);
plot(p, abs(w_4(p)-exact(p))./exact(p), p, abs(w_5(p)-exact(p))./exact(p))
legend('4th degree', '5th degree')
title("1b) $x'=-10x$ Relative Error over [0, 1]", 'interpreter', 'latex')
pause  

