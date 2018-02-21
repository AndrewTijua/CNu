function [p] = lagrange(x, i)
  interpol = zeros(1, size(x,2));
  interpol(i) = 1;
  p = polyfit(x,interpol,size(x,2)-1);
end