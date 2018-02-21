function [p] = powers_of_two(n)
  p = 0;
  if mod(n,2) == 1
      
  else
      p = 1;
      p = p + powers_of_two(n/2);
  end
end