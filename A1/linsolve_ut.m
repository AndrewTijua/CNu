function [x] = linsolve_ut(A, b)
  % This function solves A x = b, where A is a non-singular upper triangular
  % square matrix, using backward substitution. For further details see
  % ``Introduction to Scientific Computing Using Matlab'', I. Gladwell, J. G.
  % Nagy, and W. F. Ferguson, Jr, 2011, section 3.2.4.

  N = size(A, 1);
  x = zeros(N, 1);
  for i = 1:N
    row = N + 1 - i;
    x(row) = (b(row) - A(row, (row + 1):N) * x((row + 1):N)) / A(row, row);
  end
end
