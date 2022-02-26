%%% Problem 1
%%% Initialize t, and x_true
dt = 0.1;
T = 10;
t = 0 :dt:T;
n = length(t);
x0 = 1;
A1 = zeros(1, n);
A1(1) = x0;

%%% Forward Euler
%%% Write a forward Euler scheme
for i = 1:n-1
    A1(i+1) = A1(i) + dt*(cos(t(i))-A1(i));
end

x_true = @(t)((1/2) * (cos(t) + sin(t) + exp(-t)));

A2 = abs(A1 - x_true(t));

%%% Backward Euler
%%% Write a backward Euler scheme
A3 = zeros(1,n);
A3(1) = x0;
for k = 1:n-1
    A3(k+1) = (A3(k) + dt * cos(t(k+1))) / (1+dt);
end

A4 = abs(A3 - x_true(t));

%%% Built-in Solver
%%% Use ode45
%%% Don't forget to transpose the solution you get from ode45.
f = @(t, x)(cos(t) - x);
tspan = [0:0.1:10];
[tee, x] = ode45(f, tspan, x0);
A5 = x';
A6 = abs(A5 - x_true(t));

%%% Problem 2
%%% Initialize the parameters
a = 8;
dt = 0.01;
T = 2;
t = 0 :dt:T;
n = length(t);
x0 = pi/4;
A7 = zeros(1, n);
A7(1) = x0;

%%% Forward Euler for dt = 0.01
%%% Initialize t and x_true
%%% Write a forward Euler scheme
for i = 1:n-1
    A7(i+1) = A7(i) + dt*(a * sin(A7(i)));
end

x_true = @(t)(2 * atan(exp(a*t)/(1+sqrt(2))));

A8 = max(abs(A7 - x_true(t)));

%%% Forward Euler dt = 0.001
%%% Reinitialize t and x_true
%%% Write a forward Euler scheme
a = 8;
dt = 0.001;
t = 0 :dt:T;
n = length(t);
z = zeros(1, n);
z(1) = x0;
for i = 1:n-1
    z(i+1) = z(i) + dt*(a * sin(z(i)));
end

A9 = A8 / max(abs(z - x_true(t)));


%%% Predictor-Corrector dt = 0.01
%%% Reinitialize t and x_true
%%% Write a forward Euler scheme and a backward Euler scheme in the same
%%% loop.
%%% The forward Euler scheme is the predictor.  The answer from forward
%%% Euler will be plugged into the sin(x_n+1) in the backward Euler scheme.
dt = 0.01;
T = 2;
t = 0 :dt:T;
n = length(t);
x0 = pi/4;
A10 = zeros(1,n);
A10(1) = x0;
for k = 1:n-1
    A10(k+1) = A10(k) + dt * a * sin(A10(k) + dt*(a * sin(A10(k))));
end

A11 = max(abs(A10 - x_true(t)));

%%% Predictor-Corrector dt = 0.001
%%% Reinitialize t and x_true
%%% Write a forward Euler scheme and a backward Euler scheme in the same
%%% loop.
%%% The forward Euler scheme is the predictor.  The answer from forward
%%% Euler will be plugged into the sin(x_n+1) in the backward Euler scheme.
dt = 0.001;
T = 2;
t = 0 :dt:T;
n = length(t);
x0 = pi/4;
z = zeros(1,n);
z(1) = x0;
for k = 1:n-1
    z(k+1) = z(k) + dt * a * sin(z(k) + dt*(a * sin(z(k))));
end
A12 = A11 / max(abs(z - x_true(t)));

%%% Builtin Solver
%%% Reinitialize t and x_true
%%% Use ode45 to solve the ODE.
%%% Don't forget to transpose the solution you get from ode45.
dt = 0.01;
T = 2;
t = 0 :dt:T;
n = length(t);
x0 = pi/4;
f = @(t, x)(a*sin(x));
tspan = [0:0.01:2];
[tee, x] = ode45(f, tspan, x0);
A13 = x';
A14 = max(abs(A13 - x_true(t)));


dt = 0.001;
T = 2;
t = 0 :dt:T;
n = length(t);
x0 = pi/4;
f = @(t, x)(a*sin(x));
tspan = [0:0.001:2];
[tea, x] = ode45(f, tspan, x0);
z = x';
A15 = A14 / max(abs(z - x_true(t)));

%%%  If you want to write local functions, put them here
