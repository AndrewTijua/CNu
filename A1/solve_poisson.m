%We want to solve Az = b

function [z] = solve_poisson(N)
    b = zeros(N-1,1);       %initialise vector b
    for i = 1:N-1           %loop over elements in vector b
        b(i) = -(1/N^2) * exp(i/N) * sin(2*pi*i/N); %set values of elements in b
    end
    y = solve_L(b);     %use previous functions to calculate y and z
    z = solve_L_T(y);   %
end