%

%    This matlab code generates Maclaurin polynomial approximation
%    solutions to the initial value ordinary differential
%    equation system (IVODES):

%       y' = F(y)  ;  y(0) = y_0  ;  y in R^n

%    where F is a quadratic polynomial (degree of all terms in F must be
%    two or less)

%    using Cauchy products

%   For example if you have n = 3 equations then your ODES look like
                                      
%                                                    2         2         2
%   x' = a[1] + b[1,1]x + b[1,2]y + b[1,3]z + c[1,1]x + c[1,2]y + c[1,3]z  +
%        d[1,1,2]xy + d[1,1,3]xz + d[1,2,3]yz

%                                                    2         2         2
%   y' = a[2] + b[2,1]x + b[2,2]y + b[2,3]z + c[2,1]x + c[2,2]y + c[2,3]z  + 
%        d[2,1,2]xy + d[2,1,3]xz + d[2,2,3]yz

%                                                    2         2         2
%   z' = a[3] + b[3,1]x + b[3,2]y + b[3,3]z + c[3,1]x + c[3,2]y + c[3,3]z  + 
%        d[3,1,2]xy + d[3,1,3]xz + d[3,2,3]yz

%  Now you will be asked to give input for your IVODEs. You will be done
%  when you reach the algorithm.

%  Give the number of equations (ne) in your system 

   ne = 2;
   
%  Give the degree (nd) of the degree of the Maclaurin polynomials

   nd = 8;
   
% All the coefficients in the IVODE are initialized to 0. After this you
% enter your coefficients.
   
   for i=1:ne
   for j=1:ne
  

     alpha(i,j) = 0;
     
     
   end
   end
   for i=1:ne
   

      a(i) = 0;

   end
   for i=1:ne
   for j=1:ne
  

     b(i,j) = 0;
     c(i,j) = 0;
     
   end
   end
   
   
   for k=1:ne
   for j=1:ne
   for i=1:ne
  

     d(i,j,k) = 0;

   end
   end
   end

% Now give the nonzero coefficients in your equation. */

%   For an example. I do 

%                           2    
%   x' = 2 - x + 3y - 2z + x - 3yz

%               2
%   y' = -3y -2z  + 4xy

%                 2
%   z' =  -2z - 2y  - 3xz + yz

%                                                    2         2         2
%   x' = a[1] + b[1,1]x + b[1,2]y + b[1,3]z + c[1,1]x + c[1,2]y + c[1,3]z  +
%        d[1,1,2]xy + d[1,1,3]xz + d[1,2,3]yz

%                                                    2         2         2
%   y' = a[2] + b[2,1]x + b[2,2]y + b[2,3]z + c[2,1]x + c[2,2]y + c[2,3]z  + 
%        d[2,1,2]xy + d[2,1,3]xz + d[2,2,3]yz

%                                                    2         2         2
%   z' = a[3] + b[3,1]x + b[3,2]y + b[3,3]z + c[3,1]x + c[3,2]y + c[3,3]z  + 
%        d[3,1,2]xy + d[3,1,3]xz + d[3,2,3]yz


% the x equation
c(1,1) = 1;
d(1,1,2)=2;
b(1,1)=-1;
c(1,2)=-1;
b(1,2)=-7/2;
a(1) = 1;

% the y equation
c(2,1) = -1;
d(2,1,2)=2;
b(2,1)=7/2;
c(2,2)=1;
b(2,2)=-1;
a(2) = -1;

% the z equation



% Now give the initial conditions (alpha) which are also the zeroth coefficients in
% the Maclaurin solutions. 

   alpha(1,1) = x_0;   
   alpha(2,1) = y_0;
   %alpha(3,1) = 0.0;

% h is the time interval for the Maclaurin polynomials */
      
   %h = 2^(-8);
   
% num_time_steps is the number of time intervals 
% (total time =  h*num_time_steps)
   
   num_time_steps = 10000;

% You have entered all the input
% The algorithm for generating the Maclaurin solutions is here. */
% The output is at the bottom of this code in the variables x,y,z

% The variable t stores the time

   
   for ns=1:num_time_steps
       
       t(ns) = (ns-1)*h; % If you want to plot your variables vs time
   
     if mod(ns,1000)==0
     
       disp(ns)
       disp(num_time_steps)
     
     end 
     
     for i=1:ne 
     
% calculate the first derivative Maclaurin coefficient of each function
% in the solution.

       alpha(i,2) = a(i);
       bcsum = 0;
       for m=1:ne 
       

         bcsum = bcsum + b(i,m)*alpha(m,1)+c(i,m)*alpha(m,1)*alpha(m,1);

       end
       dsum = 0;
       for m=1:ne
       

         for n=m+1:ne
         

           dsum = dsum + d(i,m,n)*alpha(m,1)*alpha(n,1);

         end
   
       end
       
% This is the first derivative coefficient of the Maclaurin solutions. */

       alpha(i,2) = alpha(i,2)+bcsum+dsum;

     end

% Now calculate the rest of the Maclaurin coefficients for each function. */

     for k=2:nd
     

       for i=1:ne
       

         sum1 = 0;
         for j=1:ne
         

            sum1 = sum1 + b(i,j)*alpha(j,k);

         end
         sum2 = 0;
         for j=1:ne
         

            sum22 = 0;
            for m=0:k-1
            

              sum22 = sum22+alpha(j,m+1)*alpha(j,k-m);

            end
            sum2 = sum2 + c(i,j)*sum22;

         end  
          sum3 = 0;
          for m=1:ne
          

            sum32 = 0;
            for j=m+1:ne
            

              sum33 = 0;
              for n=0:k-1
              

                sum33 = sum33 + alpha(m,n+1)*alpha(j,k-n);

              end  
              sum32 = sum32 + d(i,m,j)*sum33;

            end
            sum3 = sum3 + sum32;

          end

% These are the Maclaurin coefficients. */
          
          alpha(i,k+1) = (sum1+sum2+sum3)/k;

       end

     end 

% Now use the Maclaurin coefficients to evaluate the Maclaurin polynomials. */

      for i=1:ne
      

        temp = alpha(i,nd) + alpha(i,nd+1)*h;
        
        
        for j=1:nd-1
        
  
          temp = h*temp+alpha(i,nd-j);
     

        end
        temp1 = alpha(1,1);

% This is the value of the Maclaurin polynomial at the next time step and
%  is also the constant term in the next Maclaurin polynomial for the next
%  time step. 
        
        alpha(i,1) = temp;
     
      end    
      
       
      x(ns) = alpha(1,1);
      y(ns) = alpha(2,1);
      %z(ns) = alpha(3,1);
      
     % fprintf(fp,"  %8.8lf %8.16e \n",ns*h,alpha(1,0));
     
   end  
   
   % x(),y(),z() contain the output. If you have more output you set them
   % equal to the appropriate alpha
     
   disp('update')
   
