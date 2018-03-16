clear all;  %Initialise workspace
close all;  %Close all figures

x = linspace(-10,10,1000); %create x axis
i = 1:9; %define i's as in question
xi = (5/2) .* (i-1) - 10; %create 9 equalls spaced sample points
fi = 1./(1+xi.^2); %apply function to the 9 sample points

deg8poly = polyfit(xi, fi, 8);      %Create degree 8 fitting polynomial
deg4lsqpoly = polyfit(xi, fi, 4);   %Create degree 4 fitting polynomial

fx = 1./(1+x.^2);                           %Take f(x) of x axis 
cubsplinevals = spline(xi, fi, x);          %create vector of cubic spline values
deg8polyvals = polyval(deg8poly,x);         %create vector of degree 8 fit values
deg4lsqpolyvals = polyval(deg4lsqpoly,x);   %create vector of degree 4 fit values

hold on %take multiple plots on same figure
plot(x,fx,'r-') %plot x against fx with a red line
plot(x,cubsplinevals,'g-') %plot x against splines with a green line
plot(x,deg8polyvals,'b-') %plot x against deg8 poly with a blue line
plot(x,deg4lsqpolyvals,'k-') %plot x against deg4 poly with a black line
title('Comparison of Fits'); %set title
xlabel('$x$','Interpreter','latex'); %set x axis label with latex
ylabel('$f(x)$','Interpreter','latex');%set y axis label with latex
legend({'$f(x) = \frac{1}{1+x^2}$', '$f(x) =$ spline fitting', '$f(x) =$ degree 8 polyfit', '$f(x) =$ degree 4 polyfit'},'Interpreter','latex', 'Location', 'south')
hold off

%The cubic spline fit was the most accurate fit of the three
%This is likely due to its piecewise nature, as it fits between two
%points with the same derivative value at each endpoint. This means
%that it is rather accurate.
%
%The next most accurate was the least squares fit of degree four. 
%It is rather inaccurate but holds the correct general shape. This
%is because it has to minimise the residuals from nine points whilst
%being a degree four polynomial. 
%
%Perhaps confusingly, the least accurate fit was the degree eight fit.
%This is because it perfectly fits the nine sample points, but eight of
%them are very close to zero and one of them is one. This causes the large
%oscillations seen in the figure. But it fits the sample points exactly.