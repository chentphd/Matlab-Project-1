% n = input('Enter an integer n (2 <= n <= 10): ');
% if isa(n, 'int64')
%     disp('Yes it is int64');
%     return;
% end

% %scatter(2, 3, 'b');
% 
% x = rand(1, n);


%y = rand();


% figure; 
% insideCircle = 0;
% 
%     for i = 1:n
%         x = rand();
%         y = rand();
% 
%         if (x^2 + y^2 <= 1)
%             insideCircle = insideCircle + 1;
%             scatter(x, y , 'red');  
%             drawnow
%         end
%     end
% 
% piApprox = 4 * insideCircle / n;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% x = 1:0.01:25;
% y = sin(x);
% n = numel(x);
% figure;
% for i = 1:n
%     plot(x(1:i),y(1:i),'-r');
%     xlim([0 25]);
%     ylim([-1.1 1.1]);
%     drawnow;
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Fix n
% n = 100;
% 
% % Generate random points
% x = rand(1, n);
% y = rand(1, n);
% 
% % Determine which points are inside the circle
% inCircle = x.^2 + y.^2 <= 1;
% outsideCircle = ~inCircle;
% 
% inListx = [];
% inListy = [];
% 
% outListx = [];
% outListy = [];
% 
% for i = 1:n
%     if (x(i))^2 + (y(i))^2 <=1
%         inListx = [inListx x(1,i)];
%         inListy = [inListy y(1,i)];
%     end
%     if (x(i))^2 + (y(i))^2 > 1
%         outListx = [outListx x(1,i)];
%         outListy = [outListy y(1,i)];
%     end
% end
% 
% 
% % Plot random points
% figure;
% 
% 
% for i = 1:length(inListx)
%     scatter(inListx(1:i), inListy(1:i), 'green')
%     drawnow
% end
% hold on;
% for i = 1:length(outListx)
%     scatter(outListx(1:i), outListy(1:i), 'red')
%     drawnow
% end
% 
% %scatter(x(inCircle), y(inCircle), 'b');
% 
% %scatter(x(outsideCircle), y(outsideCircle), 'r');
% title(['Random Points for n = ' num2str(n)]);
% xlabel('x');
% ylabel('y');
% axis equal;
% 
% % Plot the circle
% theta = linspace(0, pi/2, 100);
% circle_x = cos(theta);
% circle_y = sin(theta);
% plot(circle_x, circle_y, 'b');
% 
% % Count points inside the circle
% insideCircleCount = sum(inCircle);
% 
% % Calculate π approximation
% piApprox = 4 * insideCircleCount / n;
% 
% % Display the final value of π on the plot
% text(-0.1, 0.9, ['\pi \approx ' num2str(piApprox)], 'FontSize', 12, 'FontWeight', 'bold', 'Color', 'black');

%legend('Inside Circle', 'Outside Circle', 'Circle Boundary', 'Location', 'Best');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% x = rand(1, n);
% y = rand(1, n);
% 
% x(2)




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% x = 1;
% y = 2;
% z = 3;
% fprintf("X = %2$f, Y = %3$f, Z = %1$f \n", x , y ,z)
% 
% 
% 
% times = zeros(100,1);
% tic 
% a = rand(100,100);
% for i = 1:100
%     a = a+ rand(100,100);
%     times(i) = toc;
% end
% times
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% times = zeros(100,1);
% start = tic;
% a = rand(100,100);
% for i = 1:100
%     tic
%     a = a+ rand(100,100);
%     times(i) = toc;
% end
% end_time = toc(start_time);












%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% n = 100;
% if ischar(n) == 0
%     error('This is not a char')
% end


function x = GaussElim2(A, b)
    % Check if the matrix A is square
    [m, n] = size(A);
    if m ~= n
        error('Matrix A must be square.');
    end

    % Check if the dimensions of A and b are compatible
    if size(b,1) ~= n
        error('Dimensions of A and b are not compatible.');
    end

    % Augmented matrix [A | b]
    Ab = [A, b];

    % Perform forward elimination
    for i = 1:n
        pivot = Ab(i,i);
        Ab(i,:) = Ab(i,:) / pivot;
        for j = i+1:n
            factor = Ab(j,i);
            Ab(j,:) = Ab(j,:) - factor * Ab(i,:);
        end
    end

    % Perform back substitution
    x = zeros(n, 1);
    for i = n:-1:1
        x(i) = Ab(i,n+1);
        for j = i+1:n
            x(i) = x(i) - Ab(i,j) * x(j);
        end
    end
end
