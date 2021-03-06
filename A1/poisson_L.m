%This function creates an N-1xN-1 matrix L such that L_i,j = sqrt(i+1/i) if
%i=j, -sqrt(1-i/i) if j=i-1, 0 otherwise.
%Inputs: Integer N
%Outputs: N-1xN-1 matrix L

function [L] = poisson_L(N)
    L = zeros(N-1); %Initialise L, all non-operated elements =0
    for i = 1:N-1%
        for j = 1:N-1 %loops over elements
            if i == j %checks if indices are equal
                L(i,j) = sqrt((i+1)/i); %case i=j
            elseif j == i-1 %checks if row is one less than column
                L(i,j) = -1*sqrt((i-1)/i); %case j=i-1
                %otherwise case handled in initialisation
        end
    end
end