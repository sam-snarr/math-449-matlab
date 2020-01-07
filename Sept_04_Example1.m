% MATH 449 - Notes
% Sept 04
close all
clear

n = 100;
a = 1;
r = 1;
h = 0.25;

x(1) = a;
y(1) = a;
t(1) = 0;

for k=1:n
    x(k+1)=x(k)+h*r*x(k); % factoring doesnt reduce the number of computations
    y(k+1)=a*exp(r*k*h); % t = k*h
    t(k+1)=k*h;
end

plot(x)
pause() % wont do anything until you hit enter

figure
plot(x, '*')
hold on
plot(y, 'o')

pause()
figure
polarplot(x, 1, '*')

pause()
figure
for j=1:n
    plot(t(1:j), x(1:j))
    axis([-0.25 n*h 0 10000])
    pause(0.25)
end




