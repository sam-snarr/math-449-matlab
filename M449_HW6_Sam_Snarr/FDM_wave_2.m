clear all;
close all;

c=1;
dx = 2^(-7);
dt = dx/c;
t(1) = 0;

L = 10; % length of the wave

N=L/dx; % space
M=1500; % time
w = zeros(M,N);


x_0=0;
s=1;

% initial conditions for first row (x)
for n=1:N 
    x(n) = ( -N/2 + (n-1))*dx;
    w(1,n) = exp(-s*(x(n)-x_0)^2);
    w(2,n) = exp(-s*(x(n)-x_0)^2);
end

% initial conditions for first column (t) 
a = w(1,1); % set boundary condition equal to initial condition otherwise discontinuity
for m=1:M
    t(m) = dt*(m-1);
    w(m,1) = a;
    w(m,N) = a;
end

for j=2:M-1                       % rows/time  
    fprintf('column: %i\n', j)
    for  n=2:N-1                 % columns/x 
        w(j+1,n) = 2*w(j,n) - w(j-1,n) ...
            + (c*dt/dx)^2* (w(j,n+1)-2*w(j,n) + w(j,n-1));    % Centered difference
    end
end


x = x+L/2;

% plot movie of wavefigure
hold on
for i=1:50:M
     fprintf('plot: %i, out of %i\n', i, M)
     plot(x,w(i,:));
     ylim([min(min(w)),max(max(w))])
     pause(0.0001)
 end




