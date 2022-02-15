
%%% Problem 1
data = readmatrix('lynx.csv');
t = data(1, :);
pop = data(2, :);
%%% Don't delete the lines above when submitting to gradescope

%%% Replace the value of the population for the years given in the assignment file and save it as A1
pop(1956-1946+1) = 34;
pop(1974-1946+1) = 27;
A1 = pop;

%%% Calculate the value of the cubic spline interpolation of the data at t = 24.5 using the interp1 function.  Save this as A2.
tplot = linspace(min(t), max(t), 10000);
A2 = interp1(t, pop, 24.5, 'spline', 'extrap');

%%% Use polyfit to calculate the coefficients for A3, A5, and A7
%%% Use norm to calculate the error for A4, A6, and A8
A3 = polyfit(t, pop, 1);
A4 = norm(polyval(A3, t) - pop);
A5 = polyfit(t, pop, 2);
A6 = norm(polyval(A5, t) - pop);
A7 = polyfit(t, pop, 10);
A8 = norm(polyval(A7, t) - pop);

%%% Problem 2
data = readmatrix('CO2_data.csv');
t = data(1, :);
co2 = data(2, :);
%%% Don't delete the lines above when submitting to gradescope

%%% Use polyfit to calculate the coefficients for A9
%%% Use norm to calculate the error for A10
A9 = polyfit(t, co2, 1);
A10 = norm(polyval(A9, t) - co2);

%%% Fit the exponential
coeffs = polyfit(t, log(co2 -260),1);
A11 = [exp(coeffs(2)), coeffs(1), 260];
A12 = norm(exp(coeffs(1) * t + coeffs(2)) + 260 - co2);

%%% Fit the sinusoidal
%%% There are a few different ways to do this, and we will refrain from giving away the answer to this part.  The class has been doing loops for a while now, so this part should be doable, albeit a little tricky.  We can however check to see if there are any bugs that we can spot.
amp = 0;
amps = zeros(1,12);
for i = 1:62
    for j = 1:12
        amps(j) = co2(12*(i-1)+j) - (exp(coeffs(1) * t(12*(i-1)+j) + coeffs(2)) + 260);
    end
    amp = amp+(max(amps) - min(amps)) / 2;
end
A = amp / 62;
A13 = [A , 2*pi];
A14 = norm((exp(coeffs(1) * t + coeffs(2)) + 260 + A * sin((2*pi) * t)) - co2);
plot(t, co2, 'ko', t,(exp(coeffs(1) * t + coeffs(2)) + 260 + A * sin((2*pi) * t)), 'linewidth',1, 'markersize', 4)