function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
% Aiden Bullock
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination
m = length(x);
n = length(y);
if m~=n
    error('The matrices arent the same size')
end

[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);
% Filtered x and y matrices
xFilt = ;
yFilt = ;



sxy = sum(xFilt.*yFilt);
sx = sum(xFilt);
sy = sum(yFilt);
sx2 = sum(xFilt.^2);
sy2 = sum(yFilt.^2);
yavg = mean(yFilt);

%Slope 
slope = (m*sxy-sx*sy)/(m*sx2-sx^2);
%Intercept
intercept = yavg-slope*mean(x);
% Normal Equations - See why it might be nice to make this function?
y_reg = slope*x+intercept;
% R^2
Rsquared = ((n*sxy-sx*sy)/sqrt(n*sx2-sx^2)/sqrt(n*sy2-sy^2))^2;

end
