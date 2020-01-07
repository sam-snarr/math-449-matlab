

% FE
h=pi/256;
n=500;

w(1) = theta_0;
t(1) = 0;

for i=1:n
    w(i+1) = w(i) + h* (A + sin(w(i)));
    t(i+1) = h*i;
end

plot(t,w, '.-')