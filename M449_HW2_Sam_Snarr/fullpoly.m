function y = fullpoly(a)
 
		n = length(a);
        h = pi/256;
        t = 0:h:pi/2;
        y(1)=a(1);
        
        for j = 1:length(t)
            y(j) = horner(a,j*h,n);
        end
        
        plot(t,y)
end
