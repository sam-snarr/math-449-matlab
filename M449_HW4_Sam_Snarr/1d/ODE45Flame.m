function dy = ODE45Flame(t,y)
    dy = zeros(2,1);    % a column vector

    dy(1) = y(1)^2 +2*y(1)*y(2)-y(1)-y(2)^2-7/2*y(2)+1;
    dy(2) = -y(1)^2 +2*y(1)*y(2)+7/2*y(1)+y(2)^2-y(2)-1;

end