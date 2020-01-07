function [t,w] =  RK4(b, h, alpha)

% RK4 for systems

% approximates the solutions of systems of m
% differential equations that are written in the form

% dy1/dt = f1(t,y1,y2,...,ym)
% dy2/dt = f2(t,y1,y2,...,ym)
% .
% .
% .
% dym/dt = fm(t,y1,y2,...,ym)

% with t in the interval [0 b] and the initial conditions are in the
% h is the time step 
% alpha is the initial conditions

% The algorithmic scheme in this file was drawn from the book of Burden & Faires
% Numerical Analysis, 7th Ed.

% Author: Alain G. Kapitho
% Date  : Jan. 2006

m = size(alpha,2);
if m == 1
   alpha = alpha';
end

a = 0;
N = ceil((b-a)/h)+1;        % the number of time steps
t(1) = a;

w(:,1) = alpha;     % put initial conditions in solutions

for i = 1:N
   k1 = h*f(t(i), w(:,i));
   k2 = h*f(t(i)+h/2, w(:,i)+0.5*k1);
   k3 = h*f(t(i)+h/2, w(:,i)+0.5*k2); 
   k4 = h*f(t(i)+h, w(:,i)+k3);
   w(:,i+1) = w(:,i) + (k1 + 2*k2 + 2*k3 + k4)/6;
   t(i+1) = a + i*h;
end


[t' w'];

end


%function relating the right-hand side of the differential equation
%it has to be changed accordingly to the problem at hand
%in this case, the system of differential equations is:

% dy1/dt = y2
% dy2/dt = -y1 + tan(t)

% change before proceeding to the command line

function dy = f(t, y)

dy = [ y(1)^2-y(2)^2+1; % x'
       2*y(1)*y(2) ];   % y'

end


