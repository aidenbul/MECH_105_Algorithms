function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

%% Error Checking- Length and Equally Spaced
% Everything works here
m = length(x);
n = length(y);
if m~=n
    error('These functions are not the same length!')
end
%Checking if the matrix inputted is equally spaced
b = x(1,m);
a = x(1,1);
Esp = linspace(a,b,m); %Using linspace to see what a proper equally spaced function would look like
if Esp ~= x
    error('This matrix is not equally spaced!') 
end

%% Trapezoidal Rule 
% Look at number of suintervals
% If odd then we need to use trapezoidal rule for last interval
N = (b-a) ;
s = (-1)^N;
% if s = -1, then N is odd, even otherwise
if s == -1
    warning('Using trapezoidal for last interval')
   delY = y(1,m) - y(1,m-1);
   Tr = (delY/2)*(x(1,m) + x(1,m-1));
else
    Tr = 0;
end
h = (b-a)/2;
Odd = 0;
Even = 0;
X = y(1,1)+y(1,m);
for i = 1:2:n-1
	Odd=Odd+y(i);
end
for i = 2:2:n-2
	Even=Even+y(i);
end

I3 = (h/3)*(X+4*Odd+2*Even);

I = I3+Tr;
disp(I);
end