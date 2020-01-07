% notes 9/11
close all
clear all
clc


theta_0 = pi/4;
h=0.125; 
n=100;
A = 1;

u_FE(1) = theta_0;
t(1) = 0;

for i=2:n
    u_FE(i) = u_FE(i-1) + h*(A+sin(u_FE(i-1)));
    t(i) = i*h;
end

u_CE(1)=theta_0;
u_CE(2)=u_FE(2);

for i=3:n
    u_CE(i) = u_CE(i-2)+2*h*(A+sin(u_CE(i-1)));
end

figure
hold on
plot(t, u_FE, 'o')
plot( t, u_CE, '+')
legend('FE', 'CE')


