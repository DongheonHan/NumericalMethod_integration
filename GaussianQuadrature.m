%{ 
Author: Dongheon Han
Version: 1
I worked on the homework assignment alone, using only course materials
%}
clc, clear;
format long
%% 2 point Gaussian Guadrature
fprintf('****2 points Gaussian Guadrature\n');  
fx = @(x) exp(-1.7*x)-1.1*x^3-0.9*x+10;

a = input('Enter the value of lower limit : '); % lower limit
b = input('Enter the value of upper limit : '); % upper limit

a0 = (b+a)/2;
a1 = (b-a)/2;

I = a1*(fx(a0+a1*(-1/sqrt(3)))+fx(a0+a1*(1/sqrt(3))));
fprintf('2 points Gaussian Guadrature: %d',I);

%% 3 point Gaussian Guadrature
fprintf('\n****3 points Gaussian Guadrature\n');  
fx = @(x) x*sin(0.9*x)-2.5*exp(0.9*x)+0.3*x^2+200; % given function to calculate

a = input('Enter the value of lower limit : '); % lower limit
b = input('Enter the value of upper limit : '); % upper limit

a0 = (b+a)/2;
a1 = (b-a)/2;

I = a1*(5/9*fx(a0+a1*(-1/sqrt(5/3)))+8/9*fx(a0)+5/9*fx(a0+a1*(1/sqrt(5/3))));
fprintf('Your estimation with 3 point Gaussian Quadrature is %d',I);
%% 4 point Gaussian Guadrature
fprintf('\n****4 points Gaussian Guadrature\n');  
fx = @(x) x*cos(-2*x)-2.4*sin(0.9*x)+2*x+0.46; % given function to calculate

a = input('Enter the value of lower limit : '); % lower limit
b = input('Enter the value of upper limit : '); % upper limit

a0 = (b+a)/2;
a1 = (b-a)/2;

I = a1*(0.3478548*fx(a0+a1*(-0.861136312))+0.6521452*fx(a0+a1*(-0.3399811044))...
    +0.6521452*fx(a0+a1*0.339981044)+0.3478548*fx(a0+a1*0.861136312));

fprintf('\nYour estimation with 4 point Gaussian Quadrature is %d\n',I);
