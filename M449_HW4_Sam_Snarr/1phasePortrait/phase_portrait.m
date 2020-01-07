
close all;
 % no domain is given, so I will use [-5,5] x [-5,5] 
%    with 50 subintervals in each direction
xdom = linspace(-5,5,200);
ydom = linspace(-5,5,200);

[X,Y] = meshgrid(xdom,ydom); % generate mesh of domain

% a
% dX = X.^2 - Y.^2 - 1; 
% dY = 2*X.*Y;   

% b
% dX = X.^2 - Y.^2 + 1; 
% dY = 2*X.*Y;  

% c
% dX = X.^2 - Y.^2 ;
% dY = 2*X.*Y - 2;   

% d
dX = X.^2 +2*X.*Y -X-Y.^2-7/2*Y+1; 
dY = -X.^2+2*X.*Y+7/2*X+Y.^2-Y-1;   

dX = dX./sqrt(dX.^2+dY.^2);
dY = dY./sqrt(dX.^2+dY.^2);

quiver(X,Y,dX,dY) 
hold on
[m, c1] = contour(X, Y, dX, [0 0])
[m, c2] = contour(X, Y, dY, [0 0])

c1.LineWidth = 1; c1.LineColor = 'r';
c2.LineWidth = 1; c2.LineColor = 'r';








% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% f = @(t,Y) [Y(2); -sin(Y(1))];
% 
% y1 = linspace(-2,8,20);
% y2 = linspace(-2,2,20);
% 
% % creates two matrices one for all the x-values on the grid, and one for
% % all the y-values on the grid. Note that x and y are matrices of the same
% % size and shape, in this case 20 rows and 20 columns
% [x,y] = meshgrid(y1,y2);
% size(x)
% size(y)
% 
% u = zeros(size(x));
% v = zeros(size(x));
% 
% % we can use a single loop over each element to compute the derivatives at
% % each point (y1, y2)
% t=0; % we want the derivatives at each point at t=0, i.e. the starting time
% for i = 1:numel(x)
%     Yprime = f(t,[x(i); y(i)]);
%     u(i) = Yprime(1);
%     v(i) = Yprime(2);
% end
% 
% quiver(x,y,u,v,'r'); figure(gcf)
% xlabel('y_1')
% ylabel('y_2')
% axis tight equal;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
