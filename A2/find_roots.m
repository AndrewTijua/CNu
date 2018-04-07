clear all %clear workspace
close all %close all figures
f = @(x) cos(pi.*x).^3 + (0.01).*(x + ones(size(x)).*2).^(1/10); %create function f as given
fig1 = figure; %going to produce two figures in this script so need to select figure
figure(fig1); %current figure is fig1
plot(linspace(-1,1,500), f(linspace(-1,1,500)), 'k'); %plot f(x) between x=-1 and 1
xlabel('$x$','Interpreter','latex'); %lebel x axis
ylabel('$\cos(\pi x)^3 + 0.01(x+2)^{(1/10)}$','Interpreter','latex'); %label y axis
x_star_negative = fsolve(f, -0.25,optimset('Display','off'));%solve for negative root in x in -1, 1, display
x_star_positive = fsolve(f, 0.25,optimset('Display','off'));%solve for positive root in x in -1, 1, display
x_star_negative %display x_star_negative
x_star_positive %display x_star_positive

[x_n, n, x_fp] = fp_solve(f, -2/3);%use fixed point iteration as directed
disp(sprintf('Fixed point: n=%d, x=%f',n,x_n)) %display nicely formatted output
df = @(x) 0.001.* (x + ones(size(x)).*2).^(-9/10) - 3.*pi.*sin(pi.*x).*(cos(pi.*x).^2);%define first derivative of f for newton method

[x_n, n, x_newton] = newton_solve(f, df, -2/3); %use newton raphson as directed
disp(sprintf('Newton-Raphson: n=%d, x=%f',n,x_n))%display nicely formatted output
fig2 = figure; %prepare second figure
figure(fig2); %select second figure
hold on %plotting multiple things so need to tell matlab not to override
[x_n, n, x_fp] = fp_solve(f, 2/3); %get x_fp for positive
[x_n, n, x_newton] = newton_solve(f, df, 2/3); %get n_newton for positive
plot(0:6, abs(x_fp(1:7) - ones(size(0:6)).*x_star_positive)); %plot error in x_fp first 7 entries
plot(0:6, abs(x_newton(1:7) - ones(size(0:6)).*x_star_positive)); %plot error in x_newton first 7 entries
legend('fixed point error at xth iteration','newton error at xth iteration') %create legend
hold off %stop adding to figure

%From this we clearly see that the newton method converges incredibly
%quickly compared to the fixed point method. The newton method takes 6
%iterations and the fixed point method takes 34 iterations to get within
%tolerance. Notice that 34 ~ 6^2. This is due to the newton method being a
%second order method, whilst the given fixed point iteration is first order
%(see lectures 9, 10). The newton method is faster almost always. 

function [x_n, n, x_fp] = fp_solve(f, x_0) %fp iterative solver
x_fp = zeros(1); %x_fp will be dynamically resized
n = 0; %set n = 0
x_n = x_0; %initialise x_n
x_fp(1) = x_0; %set first value of x_fp
while abs(f(x_n)) > 1e-10 %loop while error is greater than 10^-10
   n = n + 1; %step n by 1
   x_fp(n+1) = x_n + (x_n / abs(x_n))*f(x_n); %assign x_fp value
   x_n = x_n + (x_n / abs(x_n))*f(x_n); %apply fixed point equation for x_n+1
end
end

function [x_n, n, x_newton] = newton_solve(f, df, x_0) %newton iterative solver
x_newton = zeros(1); %x_newton will be dynamically resized
n = 0; %initialise n
x_n = x_0; %initialise x_n
x_newton(1) = x_0; %set first value of x_newton to x_n
while abs(f(x_n)) > 1e-10 %loop while error is greater than 10^-10
   n = n + 1; %step n up by 1
   x_newton(n+1) = x_n - (f(x_n)./df(x_n)); %assign x_newton value
   x_n = x_n - (f(x_n)./df(x_n)); %apply newton raphson equation for x_n+1
end
end