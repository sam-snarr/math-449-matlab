% Shooting method for nonlinear BVP using 
% Newtons method for convergence

% a = 0;
% b = 1.56708;
% 
% alpha = 1;
% beta = 1.982;


N = 1000;
h = (b-a)/N;
M = 2^5;
k_0=1;
k = zeros(1,1);
TK = (beta-alpha)/(b-a);
TOL = 2^-10;

while k_0<M
    w(2,1)=alpha;
    w(3,1)=TK;
    u2=0;
    u3=1;
    
    for i=1:N
        x(i) = a + i*h;
        
        k(2,2) = h*w(2,i);
        k(2,3) = h*f(x(i), w(2,i));
        k(3,2) = h*(w(3,i)+1/2*k(2,3));
        k(3,3) = h*f(x(i)+h/2, w(2,i)+1/2*k(2,2));
        k(4,2) = h*(w(3,i)+1/2*k(3,3));
        k(4,3) = h*f(x(i)+h/2, w(2,i)+1/2*k(3,2));
        k(5,2) = h*(w(3,i)+k(4,3));
        k(5,3) = h*f(x(i)+h, w(2,i)+k(4,2));
        
        w(2,i+1) = w(2,i) + (k(2,2)+2*k(3,2)+2*k(4,2)+k(5,2))/6;
        w(3,i+1) = w(3,i) + (k(2,3)+2*k(3,3)+2*k(4,3)+k(5,3))/6;
        
        kp(2,2) = h*u3;
        kp(2,3) = h*(-1*u2);
        kp(3,2) = h*(u3+1/2*kp(2,3));
        kp(3,3) = h*(-1*(u2+1/2*kp(2,2)));
        kp(4,2) = h*(u3+1/2*kp(3,3));
        kp(4,3) = h*(-1*(u2+1/2*kp(3,2)));
        kp(5,2) = h*(u3+kp(4,3));
        kp(5,3) = h*(-1*(u2+kp(4,2)));
        u2 = u2 + 1/6*(kp(2,2)+2*kp(3,2)+2*kp(4,2)+kp(5,2));
        u3 = u3 + 1/6*(kp(2,3)+2*kp(3,3)+2*kp(4,3)+kp(5,3));
    end

    if abs(w(2, N)-beta) < TOL
        for i=1:N
            %x(i) = a+i*h;
            fprintf('%f,  %f,  %f \n', x(i), w(2, i), w(3, i))
        end
        disp('Reason for stopping: error less than TOL')
        break
    else 
        TK = TK- (w(2,N)-beta)/u2;
        k_0 = k_0+1;
    end
end

if k_0==M
    disp('Reason for stopping: max iterations exceeded')
end    

plot(x, w(2,1:N))
        
function ddy = f(t, y)
    ddy = tan(t)-y;

end


