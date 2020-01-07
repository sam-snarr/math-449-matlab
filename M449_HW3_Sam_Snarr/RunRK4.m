
dt = 2^(-10);

er=1e-13;

%%%% 4(a)
%final=2;
%%%% 4(b)
%final=2^3;
%%%% 4(c)
%final=1;
%%%% 4(d)
final=1;

%%%% 4(a)
%init = [0.1]; 
%%%% 4(b)
%init = [0.5];
%%%% 4(c)
%init = [1.5];
%%%% 4(d)
init = [0.125];

[t,w] = RK4(final, dt, init);

%%%%%%%%%%%%%%%% Forward Euler algorithm
w_FE(1) = init(1);

for i=1:length(t)-1
    
      %%%% 4(a)
      %w_FE(i+1) = w_FE(i) + dt*(10-w_FE(i))*w_FE(i);
      
      %%%% 4(b)
      %w_FE(i+1) = w_FE(i) + dt*(w_FE(i)-1)^2;
      
      %%%% 4(c)
      %w_FE(i+1) = w_FE(i) + dt*(w_FE(i)^2 + 4);
      
      %%%% 4(d)
      w_FE(i+1) = w_FE(i) + dt*(768*w_FE(i)-1024*w_FE(i)^2);
    
end

plot(t,w(1,:), '.')
hold on
plot(t, w_FE, '.')
legend("RK4", "FE")
set(findall(gca, 'Type', 'Line'),'LineWidth',2)

title("$x'=768x-1024x^2;\; x(0)=0.125$", 'interpreter', 'latex')



