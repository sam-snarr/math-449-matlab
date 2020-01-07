
clear all

N=10000;
M=10000;

w = zeros(N,M);

dx = 2^(-12);
dt = 2^(-12);
t(1) = 0;

%w(1,:) = (-(0:dx:(N-1)*dx).^2);

% initial conditions
disp('init cond')
for j=1:N
    w(1,j) = -((j-1)*dx)^2;
end

for m=1:M
    disp(m)
    w(m,1) = sin((m-1)*dt);
end

for n=1:N
    disp(n)
    if mod(n, 100)==0
        disp(n)
    end
    
    t(n+1) = dt*n;
    
    for j=2:M
                
        w_prime = 2*(j*dx)^3 - 2*(j*dx)*sin(n*dt) + cos(n*dt) - w(n,j)*(w(n,j)-w(n,j-1))/dx;
        
        w(n+1, j) = w(n,j) + dt*w_prime;
        
    end
end

w = w(1:M-1, 1:N-1);
t = t(1:M-1);
plot(t, w(:,200))

% hold on
% for n=1:5:M-1
%     plot(t, w(:,n))
%     pause(0.05)
% end

% figure
% hold on
% for n=1:5:M-1
%     plot(t, w(n,:))
%     pause(0.05)
% end
% 
% hold on
% plot(t,w(:,150))

