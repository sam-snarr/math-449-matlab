num = 1000;
h = pi/256; %pi/(2*num);
Mdeg = 4;


Y(1)=theta_0; 
U(1)=sin(theta_0);
W(1)=cos(theta_0);


Yans(1) = Y(1);

for n = 1:num
  Y(2) = A + U(1);
  U(2) = A*W(1) + W(1)*U(1);
  W(2) = -A*U(1) - U(1)^2;

  for k = 2:Mdeg
      
      Y(k+1) = U(k)/(k);
      U(k+1) = (A*W(k) + cauchyprod(W,U,k-1))/(k);
      W(k+1) = (-A*U(k) - cauchyprod(U,U,k-1))/(k);
      
  end
  
  Y(1) = horner(Y,h,Mdeg+1);
  W(1) = horner(W,h,Mdeg+1);
  U(1) = horner(U,h,Mdeg+1);
  
  Yans(n+1) = Y(1);
end

plot(0:h:num*h, Yans, '.-')





