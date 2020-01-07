function y = horner(a,x,n)

% This function evaluates polynomials using horner's algorithm

  %n = length(a);
  poly = a(n-1)+a(n)*x;
  for j = 1:n-2
      poly = a(n-j-1)+x*poly;
  end
  y = poly;

end