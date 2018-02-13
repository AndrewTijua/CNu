clear all
close all

N = 32; %set N = 32


x = 0:1/N:1;
z = zeros(1,N+1);
z(2:N) = solve_poisson(N);

plot(x,z,'r-')
title('Solution to BVP');
xlabel('x');
ylabel('phi');