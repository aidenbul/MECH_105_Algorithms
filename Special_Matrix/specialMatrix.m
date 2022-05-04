function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
A = zeros(n,m);

% Now the real challenge is to fill in the correct values of A
A(1,:) = 1:m; 
A(:,1) = 1:n; 
if nargin>2     %If the user inputs more than two inputs it will spit back an error
    error('Two inputs should be put in, please try again!')
elseif nargin == 2  %If they input the correct amount of inputs then let it run
    for i = 2:n 
        for j = 2:m
            A(i,j) = (A(i-1,j)+A(i,j-1));
        end 
    end
    disp(A)
else nargin < 2     %If the user inputs less than two inputs it will spit back an error
    error('Two inputs should be put in, please try again!')
end
% Things beyond here are outside of your function
