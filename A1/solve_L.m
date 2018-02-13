%This function solves the linear system Ly = c for y, where L is as in
%poisson_L.m. It uses forward substitution and does not explicitly compute L
%Inputs: column vector c as above
%Outputs: column vector y as above

function [y] = solve_L(c)
N = size(c',2);   %This is the size we are working with, 
y = zeros(N,1);   %locally define as N, is actually N-1
c = c'; %thinking in rows makes this easier
L_ud = zeros(1,N); %These arrays will hold the computed diagonals of L
L_ld = zeros(1,N-1);

for i = 1:N
    L_ud(i) = sqrt((1+i)/i); 
end

for i = 1:N-1
    L_ld(i) = -sqrt((i)/(i+1)); %i is shifted one relative to L
end


y(1) = c(1)/L_ud(1); %as the lower diagonal has 
%one less element, deal with special case
for i = 2:N
    y(i) = (c(i) -( L_ld(i-1)*y(i-1)))/ L_ud(i);
    %perform forward substitution, special case as matrix is mostly zeros
end