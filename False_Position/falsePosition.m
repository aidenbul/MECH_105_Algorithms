function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit)
%falsePosition finds the root of a function using false position method
%%Inputs
%func- The function that we are using
%xl- Lower guess
%xu- Upper guess
%es- Error
%maxit- Max iterations
%%Outputs
%root- real root
%fx- Value of the function at x
%ea- Approximate error
%iter- Number of iterations

if func(xl)==0 %Checking if f(xl) is a root
    error('xl is the root of the function')
end
if func(xu)==0 %Checking if f(xu) is a root
    error ('xu is the root of the function')
end
if func(xl)*func(xu)>= 0 %Checking to see if the two guesses have opposite sign
    error('These do not bracket the root')
end

x_new = xu-(func(xl)-(xl-xu))/(func(xl)-func(xu)); %Using bisection equation
ea = 100; %Just to start up the while loop %Maybe dont even need this part
iter = 0; %ok
for i=1:maxit

while ea>es
    xr = (func(x_old)-(xl-x_old))/(func(xl)-func(x_old)); %Using bisection equation
    ea = abs((x_new-x_old)/x_new)*100; %Setting a new value to error
    iter = iter+1; %ok
    if iter == maxit
        break
    end
    x_new = xr;
    x_old = ; %Need to find a way to store old value into here
end
end
root = x_new;
fx=func(root);