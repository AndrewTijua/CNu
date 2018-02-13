%We want to solve Az = b

function [z] = solve_poisson(N)
    b = zeros(N-1,1);
    for i = 1:N-1
        b(i) = -(1/N^2) * exp(i/N) * sin(2*pi*i/N);
    end
    y = solve_L(b);
    z = solve_L_T(y);
end