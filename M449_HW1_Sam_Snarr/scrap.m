
% testing whether 2a FE algorithm works for w(kh)

close all
clear all

a=2;
b=-4;

x_0 =1;
t(1)=0;

n=100;
h=0.1;

for i=1:n
    w_FE(i)= (1+a*h)^i * (x_0 + b/a) - b/a;
    t(i) = (i-1)*h;
    exact(i) = 2-exp(2*i*h);
end

% 2a BE w(kh)

w_BE(1)=1;

for i=1:n
    w_BE(i)= (x_0+b/a)/(1-a*h)^i - b/a;
end


figure
hold on
plot(t, w_FE)
plot(t, w_BE)
plot(t, exact)
xlim([0,2])
title(['Forward Euler h size = ', num2str(h)])
legend('FE', 'BE', 'Exact')

figure
hold on
plot(t, abs((w_FE-exact)./exact))
plot(t, abs((w_BE-exact)./exact)) 
legend('FE', 'BE')
title('Relative Error')


