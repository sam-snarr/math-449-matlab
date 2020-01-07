p = @(x) sin(x);

num = 128;
h = pi/256;

w(1)=A;
t(1)=0;
w(2) = w(1) + h*B;
t(2)=h;

for i=2:num
    w(i+1) = 1/(m/h^2+f/(2*h)) * (p(i) + w(i)*(2*m/h^2-c) + w(i-1)*(f/(2*h)-m/h^2));
    t(i+1) = i*h;
end

plot(t, w, '.-')