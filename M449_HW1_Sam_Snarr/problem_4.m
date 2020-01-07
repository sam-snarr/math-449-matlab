% Problem 4
% Differential Eqn: x'' = rx

close all 
clear all
format rat
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

partC_D_plot(1,1,-1)

partC_D_plot(1,1,0)

partC_D_plot(-1,1,1)

%%%%%%%%%%%% part c and d
function partC_D_plot(r, a, b)
    h=1/32;
    n=1000;

    %%%%%%%%% centered difference method
    w_center_diff(1)=a; 
    w_center_diff(2)= w_center_diff(1) + h*b; % FE approx for CE using initial conditions

    for i=1:n
        w_center_diff(i+2) = h^2*r*w_center_diff(i+1) + 2*w_center_diff(i+1) - w_center_diff(i);
    end
    
    %%%%%%%%% auxiliary method to reduce order of DE from 2 to system of 1
    w_aux(1)=a;
    u(1)=b;
    t(1)=0; 

    % approximate first two points with FE
    w_aux(2) = w_aux(1) + u(1)*h;
    u(2) = u(1) + r*w_aux(1)*h;
    t(2)=h;

    % implements CE using auxiliary variable
    for i=1:n
        w_aux(i+2) = w_aux(i) + u(i+1)*2*h;
        u(i+2) = u(i) + r*w_aux(i+1)*2*h;
        t(i+2) = i*h;
    end

    %%%%%%%%%% creates exact solution to DE depending on value of r
    if r>0
        f = @(x) 1/2*(a+b/sqrt(r))*exp(sqrt(r)*x) + 1/2*(a-b/sqrt(r))*exp(-sqrt(r)*x); 
    elseif r<0
        f = @(x) a*cos(sqrt(-r)*x) + b/sqrt(-r)*sin(sqrt(-r)*x); % swap sign r => -r
    elseif r==0
        f = @(x) b*x + a;
    end

    % plots
    figure 
    plot(t, w_center_diff, 'k.') 
    hold on
    plot(t, w_aux, 'r.') 
    fplot(f, 'b')
    xlim([0,2])
    legend('CE difference', 'CE auxiliary', 'Exact')
    title("x'' = rx; r="+ r +", a="+ a +", b=" + b + ", h="+h)
    
    % error
    figure
    plot(t, abs((f(t)-w_center_diff)./f(t)), 'k.', t, abs((f(t)-w_aux)./f(t)), 'r.')
    xlim([0,2])
    legend('CE difference', 'CE auxiliary')
    title("relative error, r="+ r +", a="+ a +", b=" + b + ", h="+h)    
    
end



