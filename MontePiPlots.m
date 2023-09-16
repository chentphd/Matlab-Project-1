% n = 1000000; % Number of points
% [piApprox, absError, relError] = MontePi(n);
% disp(['Approximated π: ' num2str(piApprox)]);
% disp(['Absolute Error: ' num2str(absError)]);
% disp(['Relative Error: ' num2str(relError)]);


% (b) Part 1: Time the execution for various values of n
n_values = 1:1000;

execution_times = zeros(size(n_values));

for i = 1:length(n_values)
    n = n_values(i);
    tic;
    MontePi(n);
    execution_times(i) = toc;
end

figure;
plot(n_values, execution_times, 'bo-');
title('n vs. Execution Time ');
xlabel('n (Number of Points)');
ylabel('Execution Time (seconds)');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (b) Part 2: Compute approximations of  for various values of n and plot absolute errors
%n_values = 1:1000;
abs_errors = zeros(size(n_values));

for i = 1:length(n_values)
    n = n_values(i);
    [~, absError, ~] = MontePi(n); 
    abs_errors(i) = absError;
end

figure;
loglog(n_values, abs_errors, 'ro-');
title('Absolute Error vs. n');
xlabel('n (Number of Points)');
ylabel('Absolute Error');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fix n to 100 
n = 100;

% Generate random points
x = rand(1, n);
y = rand(1, n);

% Determine which points are inside the circle
inCircle = x.^2 + y.^2 <= 1;
outsideCircle = ~inCircle;

inListx = [];
inListy = [];

outListx = [];
outListy = [];

% Appends the points in and out of the circle 
for i = 1:n
    if (x(i))^2 + (y(i))^2 <=1
        inListx = [inListx x(1,i)];
        inListy = [inListy y(1,i)];
    end
    if (x(i))^2 + (y(i))^2 > 1
        outListx = [outListx x(1,i)];
        outListy = [outListy y(1,i)];
    end
end


% Plot
figure;

% Plots points that are in the circle 
hold on;
for i = 1:length(inListx)
    scatter(inListx(1:i), inListy(1:i), 'green')
    drawnow
end
hold on;

% Plots points that are out the circle 
for i = 1:length(outListx)
    scatter(outListx(1:i), outListy(1:i), 'red')
    drawnow
end
hold on;


%Checking my work with scatter all points at once 
%scatter(x(inCircle), y(inCircle), 'magenta');
%scatter(x(outsideCircle), y(outsideCircle), 'yellow')

title(['Random Points for n = ' num2str(n)]);
xlabel('x');
ylabel('y');
axis equal;

hold on;
% Plot the circle
theta = linspace(0, pi/2, 100);
circle_x = cos(theta);
circle_y = sin(theta);
plot(circle_x, circle_y, 'b');

hold on;
% Count points inside the circle
insideCircleCount = sum(inCircle);

hold on;
% Calculate π approximation
piApprox = 4 * insideCircleCount / n;

hold on;
% Display the final value of π on the plot
text(-0.1, 0.9, ['\pi \approx ' num2str(piApprox)], 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'black');

hold on;
xlabel('x-values between [0,1]');
hold on;
ylabel('y-values between [0,1]');




%hold on 
%legend('Inside Circle', 'Outside Circle', 'Circle Boundary', 'Location', 'Best');
%legend doesn't work because scatter is being called finite amount of times
%and based on how legend works, it colors all green. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [piApprox, absError, relError] =  MontePi(n)
%MONTEPI Give an integer n for the number of points to be used in the Monte-Carlo approximation
% and returns 3 values of piApprox, absError, and relError
%INPUT: integer n 
%OUTPUT:  [piApprox, absError, and relError]
    insideCircle = 0;

    for i = 1:n
        x = rand();
        y = rand();

        if (x^2 + y^2 <= 1)
            insideCircle = insideCircle + 1;
        end
    end

    piApprox = 4 * insideCircle / n;
    absError = abs(pi - piApprox);
    relError = absError / pi;
end

