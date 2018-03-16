clear all %Initialise the workspace
close all %Close all plots

N = 32; %set N = 32


x = 0:1/N:1; %Create x axis vector
z = zeros(1,N+1); %Intialise solution vector
z(2:N) = solve_poisson(N); %set points z_1 ... z_n-1 to solution values

plot(x,z,'r-') %plot x against z with a red line
title('Solution to IVP'); %set title
xlabel('$x$','Interpreter','latex'); %set x axis label with latex
ylabel('$\psi$','Interpreter','latex');%set y axis label with latex