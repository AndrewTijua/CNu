clear all %clear workspace
close all %close all figures

format long %allows us to see errors in decimal places past 4th

F = @(x) exp(x) .* sin(x); %create function F(x)
dF = @(x) exp(x) .* sin(x) + exp(x) .* cos(x); %non approximate F'(x)

%implement given numerical approximation for 1st derivative
num_diff = @(F, x, dx) (dx.^(-1)) .* ((1/28) .* F(x + 5.*dx) + (1/4) .* F(x + dx) - (2/7) .* F(x - 2.*dx));

dxs = [0.0032, 0.0016, 0.0008, 0.0004, 0.0002, 0.0001]; %array of given dxs

num_derivs = num_diff(F, ones(1,6).*(pi/2), dxs) %computes and displays numerical approximations of derivative
derivs = ones(1,6).*dF(pi/2); %array of true derivative

error = abs(num_derivs - derivs) %display error magnitude


%From these values we see that the smaller a value of dx that is given the
%better approximation for F' we getuntile we get to dx^2 < 1e14 in which
%case the error starts to increase again
dxs = [1e-7, 1e-8, 1e-9, 1e-10, 1e-11, 1e-12, 1e-13, 1e-14, 1e-15]; %new array of dxs
num_derivs = num_diff(F, ones(1,9).*(pi/2), dxs); %array of approximate derivatives for above dxs
derivs = ones(1,9).*dF(pi/2); %array of exact derivatives for above dxs
error = abs(num_derivs - derivs) %error in approximate derivatives above
%As you can see the error begins to increase rapidly. This is in line iwth
%what we know from lecture 7. This is due to floating point precision not
%being enough at those levels. 