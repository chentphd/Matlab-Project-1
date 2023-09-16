% A = [1 -2 3; 3 -5 7; 7 6 11];
% b = [5 ; 2 ; 2];
% x = GaussElim(A, b);
% disp('Solution x:');
% disp(x);

%Example input above 
% Get matrix A from the user
A = input('Enter the matrix A: ');
% Get vector b from the user
b = input('Enter the vector b: ');


x = GaussElim(A, b);
disp('Solution x:');
disp(x);

function x = GaussElim(A, b)
%GAUSSELIM Takes as inputs a matrix A in R^nxn and a vector b in R^n. Using
%Gaussian Elimination, returns the vector x in R^n such that Ax=b.
%INPUTS: n x n Matrix A, n  x 1 vector b
%OUTPUTS: n x 1 soltion vector x 

    % Check if object A is matrix
    if ~ismatrix(A)
        error('Object A must be a matrix. Retype another matrix.')
    end

    % Check if the matrix A is square
    [m, n] = size(A);
    if m ~= n
        error('Matrix A must be square. Retype another matrix.');
    end

    % Check if the dimensions of A and b are compatible
    if size(b,1) ~= n
        error('Dimensions of A and b are not compatible. Run the program again with appropriate dimensions');
    end

    %Check if matirx is really non-singular. 
    % We assume all matrix A is non-singular in order to have solution 
    if det(A) == 0
        error('Matrix is singular because Det A = 0. Retype another matrix.')
    end


    % Augmented matrix [A | b]
    Ab = [A, b];

    % Perform forward elimination
    % Divide by pivot, multiply negative factor and add to its col
    % From AMS 510 
    for i = 1:n
        pivot = Ab(i,i);
        Ab(i,:) = Ab(i,:) / pivot;
        for j = i+1:n
            factor = Ab(j,i);
            Ab(j,:) = Ab(j,:) - factor * Ab(i,:);
            %Three operations: Divide, Multiply, subtract per step
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
