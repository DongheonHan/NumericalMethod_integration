%{
Author: Dongheon Han
Version: 1
I worked on the homework assignment alone, using only course materials
%}
clc, clear;
format long
%% Even Data Differentiation
fprintf('-*-Even Data Derivative\n');
D_evendata = dlmread('qdata1.txt',',');

% ************ DATA INPUT ************ ************ ************ ************
prompt = '(Even Data)What is the given x_Value? (Example:  0.35) ';
given_x_value = input(prompt);
% ************ ************ ************ ************ ************ **********


for i = 1 : length(D_evendata)
    find_Nth_Line = 0;
    if (given_x_value - D_evendata(i,1) == 0)
        find_Nth_Line = i;
        x0 = D_evendata(i, 1);   
        break
    end
end
fprintf('findLine: %d\n', find_Nth_Line);

% save X values: x_i,i+1,i+2 
x_im1 = D_evendata(find_Nth_Line-1, 1);
x_i = D_evendata(find_Nth_Line,1);
even_h = x_i - x_im1;

% save Y values: x_i,i+1,i+2 
fx_im2 = D_evendata(find_Nth_Line-2, 2);
fx_im1 =  D_evendata(find_Nth_Line-1, 2);
fx_i = D_evendata(find_Nth_Line, 2);
fx_ip1 = D_evendata(find_Nth_Line+1, 2);
fx_ip2 = D_evendata(find_Nth_Line+2, 2);


% 1. Forward Derivative
O_h_forward = (fx_ip1 - fx_i)/even_h;
O_h_2_forward = (-fx_ip2+4*fx_ip1-3*fx_i)/(2*even_h);

% 2. Backward Derivative
O_h_backward = (fx_i - fx_im1)/even_h;
O_h_2_backward = (3*fx_i-4*fx_im1+fx_im2)/(2*even_h);

% 3. Central Derivative
O_h_2_Central = (fx_ip1-fx_im1)/(2*even_h);
O_h_4_Central = (-fx_ip2+8*-8*fx_im1+fx_im2)/(12*even_h);

fprintf('******Forward Derivative\n');
fprintf('Compute O(h) <2points>: %d\n', O_h_forward);
fprintf('Compute O(h^2) <higher accuracy>: %d\n\n', O_h_2_forward);
fprintf('******Backward Derivative\n');
fprintf('Compute O(h): %d\n', O_h_backward);
fprintf('Compute O(h^2): %d\n\n', O_h_2_backward);
fprintf('******Central Derivative <Best>\n');
fprintf('Compute O(h^2): %d\n', O_h_2_Central);
fprintf('Compute O(h^4): %d\n\n', O_h_4_Central);

%% Uneven Data Derivative
fprintf('\n******************************\n\n-*-Uneven Data Derivative\n');
D_unevendata = dlmread('qdata2.txt',',');

% ************ DATA INPUT ************ ************ ************ ************
prompt = '(Even Data)What is the given x_Value? (Example: 0.608) ';
given_x_value_uneven = input(prompt);
% Example: given_x_value_uneven = 24.492;
% ************ ************ ************ ************ ************ **********

for i = 1 : length(D_unevendata)
    find_Nth_Line = 0;
    if (given_x_value_uneven - D_unevendata(i,1) == 0)
        find_Nth_Line = i;
        x0 = D_unevendata(i, 1);   
        break
    end
end
fprintf('findLine: %d\n', find_Nth_Line);

% Save x, fx Values from i-2 to 1+2
x_arrays=[D_unevendata(find_Nth_Line-2,1) D_unevendata(find_Nth_Line-1,1) ...
    D_unevendata(find_Nth_Line,1) D_unevendata(find_Nth_Line+1,1) D_unevendata(find_Nth_Line+2,1)];
fx_arrays=[D_unevendata(find_Nth_Line-2,2) D_unevendata(find_Nth_Line-1,2) ...
    D_unevendata(find_Nth_Line,2) D_unevendata(find_Nth_Line+1,2) D_unevendata(find_Nth_Line+2,2)];
x_target = given_x_value_uneven;

% Uneven O(h)
O_h_forward = (fx_arrays(4) - fx_arrays(3))/(x_arrays(4) - x_arrays(3));
O_h_backward = (fx_arrays(3) - fx_arrays(2))/(x_arrays(3) - x_arrays(2));

% Uneven O(h^2)
O_h_2 = zeros(3);
for iter = 1 : 3
    O_h_2(iter) = fx_arrays(iter)*((2*x_target)-x_arrays(iter+1)-x_arrays(iter+2))/((x_arrays(iter)-x_arrays(iter+1))*(x_arrays(iter)-x_arrays(iter+2)))...
        + fx_arrays(iter+1)*((2*x_target)-x_arrays(iter)-x_arrays(iter+2))/((x_arrays(iter+1)-x_arrays(iter))*(x_arrays(iter+1)-x_arrays(iter+2)))...
        + fx_arrays(iter+2)*((2*x_target)-x_arrays(iter)-x_arrays(iter+1))/((x_arrays(iter+2)-x_arrays(iter))*(x_arrays(iter+2)-x_arrays(iter+1)));
end
O_h_2_backward = O_h_2(1);
O_h_2_Central = O_h_2(2);
O_h_2_forward = O_h_2(3);
 
fprintf('******Forward Derivative\n');
fprintf('Compute O(h): %d\n', O_h_forward);
fprintf('Compute O(h^2): %d\n\n', O_h_2_forward);
fprintf('******Backward Derivative\n');
fprintf('Compute O(h): %d\n', O_h_backward);
fprintf('Compute O(h^2): %d\n\n', O_h_2_backward);
fprintf('******Central Derivative\n');
fprintf('Compute O(h^2): %d\n', O_h_2_Central);