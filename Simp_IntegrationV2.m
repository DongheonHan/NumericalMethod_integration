%{ 
Author: Dongheon Han
Version: 1
I worked on the homework assignment alone, using only course materials
%}
%% Simpson's rule integration (Even and Uneven Data): only even
clc, clear;
format long

prompt = 'even or uneven Data? (Example:even) ';
if ("even" == input(prompt,'s'))
    DataArray = dlmread('qdata1.txt',',');
elseif ("uneven" == input(prompt,'s'))
    DataArray = dlmread('qdata2.txt',',');
end

% ************ DATA INPUT ************ ************ ************ ************
a_lowerBound = input('Enter the lower bound of the integration example(even: 26.725) : ');
b_upperBound = input('Enter the bigger bound of the integration example(even: 27.025) : ');
% ************ ************ ************ ************ ************ **********

for i = 1 : length(DataArray)
    if DataArray(i,1) == a_lowerBound
        lowerIndex = i;
    elseif DataArray(i,1) == b_upperBound
            upperIndex = i;
    end
end

simpArrayData = zeros(upperIndex - lowerIndex + 1,2);
fprintf('what is the total length of data: %d\n',length(simpArrayData));

for i = 1 : upperIndex - lowerIndex + 1
    simpArrayData(i,1) = DataArray(lowerIndex+i-1,1);
    simpArrayData(i,2) = DataArray(lowerIndex+i-1,2);
end
I = 0;
key = 1; % key: if you want to choose 1/3, 3/8 MANUALLY
if rem(length(simpArrayData)-1,3) == 0 && key == 1  % key: if you want to choose 1/3, 3/8 MANUALLY
    fprintf('Simpson''s 3/8 Rule\n');
    for i = 1 : ((length(simpArrayData)-1)/3)
        I = I + (simpArrayData(3*i+1,1)-simpArrayData(3*i-2,1))...
            *(simpArrayData(3*i-2,2)+3*simpArrayData(3*i-1,2)...
            +3*simpArrayData(3*i,2)+simpArrayData(3*i+1,2))/8;
    end
else 
    fprintf('Simpson''s 1/3 Rule\n');
    for i = 1 : ((length(simpArrayData)-1)/2)
        I = I + (simpArrayData(2*i+1,1)-simpArrayData(2*i-1,1))...
            *(simpArrayData(2*i-1,2)+4*simpArrayData(2*i,2)...
            +simpArrayData(2*i+1,2))/6;
    end
end
fprintf('*******Simpson''s integration: %f\n', I);