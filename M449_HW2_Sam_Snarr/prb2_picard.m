syms t Uans Yans Wans 

h=pi/256;

Yans(1) = theta_0;
Y(1) = Yans(1);
Uans(1) = sin(theta_0);
Wans(1) = cos(theta_0);

num=10;
order=4; 

for n=1:num
    n
    for i=1:order-1
        Yans(i+1)= Yans(1) + int(A+Uans(i), t, [0,t]);
        Uans(i+1)= Uans(1) + int(A*Wans(i) + Uans(i)*Wans(i), t, [0,t]);
        Wans(i+1)= Wans(1) - int(A*Uans(i) + Uans(i)*Uans(i), t, [0,t]);
    end
    
    f1 = matlabFunction(Yans(order)); % cant use horner's method, this is a workaround
    Yans(1) = f1(h);
    
    f1 = matlabFunction(Uans(order));
    Uans(1) = f1(h);
    
    f1 = matlabFunction(Wans(order));
    Wans(1) = f1(h);
    
    Y(n+1)=Yans(1);
end

plot(0:h:n*h, Y, 'ko')


