
er = 1e-13; final = 10;

init = [x_0,y_0]; % [-20 0.0892 0.0041 0.966];  0.09 0.004 0.97

[t,y] = RK4(final, dt, init);

%plot(w(1,:), w(2,:))