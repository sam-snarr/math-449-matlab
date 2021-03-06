clear all; close all;

N=2000;   % x values (columns) 
M=500; % t values (rows)

w = zeros(M,N);

dx = 2^(-5);
dt = 2^(-6);

A=1;
B=-1;
s=0.5; 

%% initial conditions
% row 1 initial condition
for n=1:N 
    x(n) = (-N/2+(n-1))*dx;
    w(1,n) = A + B*2/pi * atan(s*x(n));    
end

% column 1 and M boundary values
w(:,1) = A + B*2/pi * atan(s*x(1));   
w(:,N) = A + B*2/pi * atan(s*x(N));

%% Algorithms %%   

%% CE  
% for j=1:M              % rows/time
%     fprintf('row: %i\n', j)
%     for  n=2:N-1        % columns/x 
%         w(j+1,n) = w(j,n) - (dt/(2*dx))*w(j, n)*(w(j,n+1)-w(j,n-1));   
%     end
% end

%% FE
% for j=1:M                 % rows/time
%     fprintf('row: %i\n', j)
%     for  n=1:N-1        % columns/x 
%         w(j+1,n) = w(j,n) - (dt/dx)*w(j, n)*(w(j,n+1)-w(j,n));   
%     end
% end

%% BE
for j=1:M              % rows/time
    fprintf('row: %i\n', j)
    for  n=2:N       % columns/x 
        w(j+1,n) = w(j,n) - (dt/dx)*w(j, n)*(w(j,n)-w(j,n-1));   
    end
end


%% plotting first 46 columns
% plot(x,w(1:M,:)');  % it blows up to infty
% xlim([-15 15])

figure
hold on
for i=1:50:M
     fprintf('plot: %i, out of %i\n', i, M)
     
     plot(x,w(i,:), '.');
     ylim([min(min(w))-0.1,max(max(w))+0.1])
     %xlim([min(x)-5,max(x)+2])
     xlim([-10,10])
     
     pause(0.05)
end
