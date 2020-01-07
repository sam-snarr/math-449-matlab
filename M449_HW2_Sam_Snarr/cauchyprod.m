% /*
% 
%    CauchyProd.m
% 
%    This code determines the CauchyProduct of two vectors
%  
% */

function y = cauchyprod(a,b,n)

% double cauchyprod(double a[],double b[], int n)
% {
% 	int i=n, j;
% 	double CauchyP;
 
		CauchyP = 0;
        for j = 0:n

           CauchyP = a(j+1)*b(n-j+1) + CauchyP;
        end
        
        y = CauchyP;
        
end
        
% 	return CauchyP;
% }
