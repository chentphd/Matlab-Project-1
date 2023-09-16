function BaseConverter
% BASE CONVERTER Converts a number from base n to base m 
% INPUTS: integer n , integer number, integer m 
% OUTPUTS: The number user entered in Base m
    % Ask the user for inputs
    n = input('Enter an integer n (2 <= n <= 10): ');
    number = input(['Enter a number in base-' num2str(n) ': '], 's');
    m = input('Enter an integer m (2 <= m <= 10): ');
    
    
    % Check if inputs are valid
    if ~(2 <= n && n <= 10) || ~(2 <= m && m <= 10)
        disp('Error: n and m must be integers between 2 and 10.');
        return;
    end

    % Check if the input number is valid in base-n
    if ~isValidBaseNumber(number, n)
        disp(['Error: The input number is not valid in base-' num2str(n) '.']);
        return;
    end

    % Convert the number from base-n to base-10
    base10_number = baseNToBase10(number, n);

    % Convert the number from base-10 to base-m
    baseM_number = base10ToBaseM(base10_number, m);

    % Display the result
    % Use fprintf() 
    % fprintf( 'First 3 digits of x is: %.4f \n',x) 
    
    disp(['Your number in base ' num2str(m) ' is: ' baseM_number]);
end

function valid = isValidBaseNumber(number, base)
%ISVALIDBASENUMBER Check if the input number is valid in base-n
%INPUT: Number in base m, base m 
%OUTPUT: Boolean to see if the number is base m
    valid_chars = ['0':'9' 'A':'Z'];
    valid_chars = valid_chars(1:base);
    valid = all(ismember(number, valid_chars));
end

function base10_number = baseNToBase10(number, base)
    % Convert the input number from base-n to base-10
    % Using https://www.youtube.com/watch?v=63QPR1vPJ6A&ab_channel=LearningMonkey
    % 1010_2 = 1*(2^3) + 0*(2^2) + 1*(2^1) + 0*(2^0) =  10_10
    % Summation of digit*base_n^(i-1th position) since we start at with i=1
    valid_chars = ['0':'9' 'A':'Z'];
    valid_chars = valid_chars(1:base);
    base10_number = 0;
    len = length(number);
    for i = 1:len
        digit = find(valid_chars == number(len-i+1)) - 1;
        base10_number = base10_number + digit * base^(i-1);
    end
end

function baseM_number = base10ToBaseM(number, base)
    % Convert the input number from base-10 to base-m
    % Using https://www.youtube.com/watch?v=-PI7ZX3UiXA&ab_channel=HCCMathHelp
    % 223_10 = 1343_5
    % Combination of Quotients starting with number_10 moded by base
    valid_chars = ['0':'9' 'A':'Z'];
    baseM_number = '';
    while number > 0
        digit = mod(number, base);
        baseM_number = [valid_chars(digit+1) baseM_number];
        number = floor(number / base);
    end
end
