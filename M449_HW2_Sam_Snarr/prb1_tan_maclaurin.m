% DE: mx" + fx' + cx = p(t)

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Maclaurin Method

num = 128;
h = pi/256; %pi/(2*num);
Mdeg = 4;

Y(1) = A;
V(1) = B;
W(1) = tan(0);
U(1) = 0;
Z(1) = 0;

clear Cons % from previous code run
Cons(1) = A^2 + B^2;

Yans(1) = Y(1);

for n = 1:num
  
  Y(2) = V(1);
  V(2) = (W(1)-c*Y(1)-f*V(1)) / m;
  U(2) = V(1)^2;
  W(2) = 1+W(1)^2;
  Z(2) = W(1)*V(1);

  for k = 2:Mdeg
      
      Y(k+1) = V(k)/(k);
      V(k+1) = (W(k)-c*Y(k)-f*V(k))/(m*k);
      U(k+1) = cauchyprod(V,V,k-1)/(k);
      W(k+1) = cauchyprod(W,W,k-1)/(k);
      Z(k+1) = cauchyprod(W,V,k-1)/(k);
  end
  
  Y(1) = horner(Y,h,Mdeg+1);
  V(1) = horner(V,h,Mdeg+1);
  W(1) = horner(W,h,Mdeg+1);
  U(1) = horner(U,h,Mdeg+1);
  Z(1) = horner(Z,h,Mdeg+1);
  
  Cons(n+1) = m*V(1)^2 + c*Y(1)^2 + 2*f*U(1) - 2*Z(1);
  Yans(n+1) = Y(1);    
end

plot(0:h:pi/2, Yans, '.-')

