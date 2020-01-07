% forward euler for:  
% theta'(x) = A + sin(theta)
% theta(0) = 0

close
clear all

A = 1.1;
h = 0.0001;
n=1000000;

theta(1)=0;
t(1) = 0;

for i=2:n
    theta(i) = theta(i-1) + h*(A + sin(theta(i-1)));
    t(i) = i*h;
end

plot(t, theta)

%figure
%polarplot(theta, 'o')