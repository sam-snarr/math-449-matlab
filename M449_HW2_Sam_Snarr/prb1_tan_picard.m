% Picard Method


syms t Yans Vans Wans Uans Zans;

Yans(1) = A;
Y(1) = A;
Vans(1) = B;
Uans(1) = 0;
Zans(1) = 0;
Wans(1) = 0;

h=pi/256;
num=10;

order=4;
clear Cons
Cons(1) = A^2 + B^2;

for n=1:num
    n
    for i=1:(order-1)
        Yans(i+1) = Yans(1) + int(Vans(i), t, [0,t]);
        Vans(i+1) = Vans(1) + 1/m * int(Wans(i)-f*Vans(i)-c*Yans(i), t, [0,t]);
        Uans(i+1) = Uans(1) + int(Vans(i)^2, t, [0,t]);
        Zans(i+1) = Zans(1) + int(Wans(i)*Vans(i), t, [0,t]);    
        Wans(i+1) = Wans(1) + int(1+Wans(i)^2, t, [0,t]);
    end
    
    f1 = matlabFunction(Yans(order)); % cant use horner's method, this is a workaround
    Yans(1) = f1(h);
    
    f1 = matlabFunction(Vans(order));
    Vans(1) = f1(h);
    
    f1 = matlabFunction(Wans(order));
    Wans(1) = f1(h);
    
    f1 = matlabFunction(Uans(order));
    Uans(1) = f1(h);
    
    f1 = matlabFunction(Zans(order));
    Zans(1) = f1(h);
    
    Y(n+1)=Yans(1);
    
    Cons(n+1) = m*Vans(1)^2 + c*Yans(1)^2 + 2*f*Uans(1) - 2*Zans(1);
end

plot(0:h:(num)*h, Y, 'ko')

