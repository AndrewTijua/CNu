clear all %clear workspace
close all %close all figures

i_ = 1:5; %create array of given is
adji = (2*i_ - ones(1,5)).*(pi/10); %compute the inside of the cosine expression
x_i =  (1/2).*ones(1,5) - (1/2).*cos(adji);%create array of x_i for is

l_i = zeros(5,5); %init lagrange polynomial array

for j = 1:5 %go 1->5
    l_i(j,:) = lagrange(x_i, j);%fit the lagrange polynomials
end
%see lagrange poly at end of file, matlab is weird like that


%find weights for quadradure w_i = int(-1,1) l_i(x)dx
w_i = zeros(1,5);
for i = 1:5
    w_i(i) = diff(polyval(polyint(l_i(i,:)), [0,1]));
end
w_i

%lets create a function to integrate
f = @(x) sin(x) .* cos(x);
%indef integral of f
F = @(x) (-1/2) .* cos(x) .^2;
F_exact = F(1) - F(0)
F_approx = sum(w_i .* f(x_i))
F_error = abs(F_exact - F_approx)
%this is a pretty damn close approximation to the integral, especially as
%only five points are used. Lets find the degree of precision

exact = 1;
degree = 0;
while exact == 1
    f = @(x) x.^degree;
    F = @(x) (1/(degree + 1)) .* x.^(degree + 1);
    F_exact = F(1) - F(0);
    F_approx = sum(w_i .* f(x_i));
    F_error = abs(F_exact - F_approx);
    if F_error < 1e-12
        degree = degree + 1;
    else
        exact = 0;
    end
end
degree - 1
%from this we see that the interpolation method has degree of precision 5,
%as x^6 is not integrated exactly but x^0 through x^5 are. (Gladwell thm 5.2.1)

%this has to be at the bottom because matlab
function [p] = lagrange(x, i) %solution to c3 reused
  interpol = zeros(1, size(x,2));%create array of interpolation points
  interpol(i) = 1;%set ith point to be one
  p = polyfit(x,interpol,size(x,2)-1);%fit polynomial to points
end