%{ 
Author: Dongheon Han
Version: 1
I worked on the homework assignment alone, using only course materials
%}
%% Roomberg rule integration (Even and Uneven Data)
clc, clear;
format long

prompt = 'even or uneven Data? remember: 2^n (Example:even) ';
if ("even" == input(prompt,'s'))
    DataArray = dlmread('finaldata1.txt',',');
elseif ("uneven" == input(prompt,'s'))
    DataArray = dlmread('finaldata2.txt',',');
end
% ************ DATA INPUT ************ ************ ************ ************
a_lowerBound = input('Enter the lower bound of the integration example(even: 0.5) : ');
b_upperBound = input('Enter the upper bound of the integration example(even: 1) : ');
% ************ ************ ************ ************ ************ **********

for i= 1 : length(DataArray)
    if DataArray(i,1) == a_lowerBound
        lowerIndex = i;
    elseif DataArray(i,1) == b_upperBound
            upperIndex = i;
    end
end
%% Trapezoid rule (I_h1, I_h2, I_h4, I_h8)
I_Array = zeros(4,4);
fprintf('\n*******Trapezoid rule(I_h1, I_h2, I_h4, I_h8) RESULT(Even && Uneven): \n');
for ii = 1 : 4
    unitIndex = ((upperIndex-lowerIndex)/(2^(ii-1)));
    for i = 1 : 2^(ii-1)
    I_Array(ii,1) = I_Array(ii,1) + ((DataArray(lowerIndex+(unitIndex*i),1)-...
        DataArray(lowerIndex+(unitIndex*(i-1)),1))*(DataArray(lowerIndex+(unitIndex*(i-1)),2)+...
        DataArray(lowerIndex+(unitIndex*i),2))/2);
    end
    fprintf('I_h%d: %f   ', 2^(ii-1), I_Array(ii,1));
end

%% Romberg Integration
for i=1:3
    I_Array(i,2) = (4*I_Array(i+1,1)-I_Array(i,1))/3;
end
for i=1:2
    I_Array(i,3) = (16*I_Array(i+1,2)-I_Array(i,2))/15;
end
I_Array(1,4) = (64* I_Array(2,3) -I_Array(1,3))/63;
fprintf('\n\n*******Print I_Array');
fprintf('\n2       4        6       8');
I_Array
fprintf('*******Romberg Integration O(h^8): %f\n', I_Array(1,4));

%% Error
a = input('I_m: ');
b = input('I_l: ');
error = (16/15) * a - (1/15) * b;
fprintf('error: %d\n',error)
