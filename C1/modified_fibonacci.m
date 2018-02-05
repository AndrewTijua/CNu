function [x_n] = modified_fibonacci(n)
  
  x_1 = 9;
  x_2 = 7;
  
  fib_arr = zeros(1,n);
  fib_arr(1) = x_1;
  fib_arr(2) = x_2;
  
  if n > 2
    for i = 3:n
        fib_arr(i) = fib_arr(i-1) + fib_arr(i-2);
    end
  end
  x_n = fib_arr(n);
end