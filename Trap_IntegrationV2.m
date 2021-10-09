%{ 
Author: Dongheon Han
Version: 1
I worked on the homework assignment alone, using only course materials
%}
%% Even && Uneven Data Integration: trapezoidRule
clc, clear;
format long

prompt = 'even or uneven Data? (Example:even) ';
if ("even" == input(prompt,'s'))
    DataArray = dlmread('qdata1.txt',',');
elseif ("uneven" == input(prompt,'s'))
    DataArray = dlmread('qdata2.txt',',');
end

% ************ DATA INPUT ************ ************ ************ ************
prompt = 'What is the given a_Value? (Example:  8.450(even), 43.326(uneven)) ';
a_input = input(prompt);
prompt = 'What is the given b_Value? (Example:  8.775(even), 43.854(uneven)) ';
b_input = input(prompt);
% ************ ************ ************ ************ ************ **********

% Make a Data Array
for i = 1 : length(DataArray)
    find_a_nthLine = 0;
    if (a_input - DataArray(i,1) == 0)
        find_a_nthLine = i;
        x0 = DataArray(i, 1)
        break
    end
end
success = 0;
iter = 0;
while (success == 0)
    if (DataArray(find_a_nthLine+iter) == b_input)
        find_b_nthLine = find_a_nthLine+iter;
        success = 1;
    end
    iter = iter + 1;
end
dataArray = zeros(iter,2);
for ii = 0 : iter - 1
    dataArray(ii+1,1) = DataArray(find_a_nthLine+ii,1);
    dataArray(ii+1,2) = DataArray(find_a_nthLine+ii,2);
end
trapezoidRule_I = 0;
for i = 1 : length(dataArray) - 1
    trapezoidRule_I = trapezoidRule_I + ((dataArray(i+1,1)-dataArray(i,1))*(dataArray(i,2)+dataArray(i+1,2))/2);
end
fprintf('\n***** the answer is %f\n', trapezoidRule_I);