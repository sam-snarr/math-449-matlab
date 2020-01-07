% approximates the differential equation  theta'(t) = r*theta(t)
% with initial condition theta(0) = a

close all; clear all; clc;

a=0;
r= 1;

n=10000;
h=0.0001;

w(1)=a;
x(1)=0;

for i=2:n
   w(i) = w(i-1)*(1+r*h);
   x(i) = i*h;
end

polarplot(w, x)



