%%% Problem 1
data = readmatrix('population.csv');
t = data(1, :);
N = data(2, :);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Determine your stepsize dt from the vector t
dt = 1;

%%% Use the appropriate second order differences from the Theory Lecture
x = 24;
A1 = (3*N(x)-4*N(x-dt)+N(x - 2*dt))/ (2*10*dt);
x = 10;
A2 = (N(x+dt)-N(x-dt))/(2*10*dt);
x = 1;
A3 = (-3*N(x)+4*N(x+dt)-N(x + 2*dt))/ (2*10*dt);

%%% For dN/dt you will need to use a combination of the above differences,
%%% but the choice will be obvious based on which direction you can/cannot
%%% go in the horizontal axis.  Whenever possible use central difference;
%%% only use forward or backward when central is not possible.
A4 = zeros(1,24);
A4(1) = A3;
A4(24) = A1;
for i=2:23
    A4(i) = (N(i+dt)-N(i-dt))/(2*10*dt);
end

A5 = zeros(1,24);
for i = 1:24
    A5(i) = A4(i) / N(i);
end

A6 = mean(A5);

%%% Problem 2
data = readmatrix('brake_pad.csv');
r = data(1, :);
T = data(2, :);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Determine your stepsize dr from the vector r
dr = 0.017;
theta = 0.7051;
%%% Use the LHR formula from the coding lecture
A7 = 0;
for i = 1:10
    A7 = A7 + dr * r(i) * T(i)*theta;
end

d = 0;
for i = 1:10
    d = d + dr * r(i) *theta;
end

A8 = A7 / d;

%%% Use the RHR formula from the coding lecture
A9 = 0;
for i = 2:11
    A9 = A9 + dr * r(i) * T(i)*theta;
end

c = 0;
for i = 2:11
    c = c + dr * r(i) *theta;
end

A10 = A9 / c;

%%% Use the Trapezoid rule formula or the trapz function from the coding lecture
A11 = (A7+A9) / 2;
A12 = A11 / ((d+c)/2);

%%% Problem 3
%%% You'll have to use anonymous functions here.  You can see the syntax in
%%% the Numerical Integration coding lecture where the builtin function
%%% "integrand" is used.
f = @(x)((x.^2) / 2 - (x.^3)/3);
f2 = @(z)(0.95 ./ sqrt(f(0.95) - (((0.95*z).^2) / 2 - ((0.95*z).^3)/3)));
A13 = integral(f2, 0, 1);

f2 = @(z)(0.5 ./ sqrt(f(0.5) - (((0.5*z).^2) / 2 - ((0.5*z).^3)/3)));
A14 = integral(f2, 0, 1);

f2 = @(z)(0.01 ./ sqrt(f(0.01) - (((0.01*z).^2) / 2 - ((0.01*z).^3)/3)));
A15 = integral(f2, 0, 1);