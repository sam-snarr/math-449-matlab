% Problem 2

close all
clear all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2a

a=2;
b=-4;

x_0=1;
n=100;
h=0.1;

% FE
for i=0:n
    w_FE(i+1)= (1+a*h)^i * (x_0 + b/a) - b/a;
    t(i+1) = i*h;
    exact(i+1) = 2 - exp(2*i*h);
end

% BE 
for i=0:n
    w_BE(i+1)= (x_0 + b/a)/(1-a*h)^i - b/a;
end


% CE
w_CE(1)=1;
w_CE(2)=w_FE(2);

for i=3:n+1
    w_CE(i)=w_CE(i-2)+(2*w_CE(i-1)-4)*2*h;
end

% plots
figure
hold on
xlim([0, 2])
plot(t, exact)
plot(t, w_FE)
plot(t, w_BE)
plot(t, w_CE)
legend('exact', 'FE', 'BE', 'CE')
title('2a)  x = 2x-4')
pause()

% error 
figure
plot(t, abs((exact-w_FE)./exact), t, abs((exact-w_BE)./exact), t, abs((exact-w_CE)./exact))
xlim([0, 2])
legend('FE', 'BE', 'CE')
title('relative error 2a')
pause()

%%%%%%%%%%%%%%%%%%%%%%%% 2b

a=-2;
b=4;

x_0 =1;
t(1)=0;
n=100;
h=0.1;

% FE
for i=0:n
    w_FE(i+1)= (1+a*h)^i * (x_0 + b/a) - b/a;
    t(i+1) = i*h;
    exact(i+1) = 2-exp(-2*i*h);
end

% BE
for i=0:n
    w_BE(i+1)= (x_0+b/a)/(1-a*h)^i - b/a;
end

% CE
w_CE(1)=1;
w_CE(2)=w_FE(2);

for i=3:n+1
    w_CE(i)=w_CE(i-2)+(4-2*w_CE(i-1))*2*h; % oscillation
end

% plots
figure
hold on
xlim([0, 2])
plot(t, exact)
plot(t, w_FE)
plot(t, w_BE)
plot(t, w_CE)
legend('exact', 'FE', 'BE', 'CE')
title('2b) x = 4-2x')
pause()

% error
figure
plot(t, abs((exact-w_FE)./exact), t, abs((exact-w_BE)./exact), t, abs((exact-w_CE)./exact))
xlim([0, 2])
legend('FE', 'BE', 'CE')
title('relative error 2b')


