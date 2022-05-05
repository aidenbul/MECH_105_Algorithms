function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix

[m,n] = size(A);
if m~=n 
    error('A must be a square matrix.')
end

L = eye(m); %Initial matrix for L
U = zeros(m); %Initial matrix for U 
P = eye(m); %Initial P matrix
% [Pr,Pc] = size(P); <-- Not sure if I even need this part
%Later in code will need to set at least top two rows equal to A

% Figuring out how to pivot here and switch the two rows
col1 = A(:,1);
[z,y] = max(col1);
z = A(1,:);
A(1,:) = A(y,:);
A(y,:) = z;
%Trying to figure out pivot matrix 
%Have another for loop just for P?
Prow1 = P(1,:);
P(1,:) = P(y,:);
P(y,:) = Prow1;






%Can I just set 1 equal to i?
for i = 1:m
    %Checking rows for the largest numbers in row and pivoting
    col1 = A(:,1); %Setting something to all of column one
[z,~] = max(col1); %Setting values for later of what is the max in row one
z = A(1,:); %Having a placeholder for row 1
A(1,:) = A(max(col1),:); %Setting row one equal to whatever row had the largest value in the first column
A(max(col1),:) = z; %Switching the row we just took equal to row 1

%Elimination step 
% Maybe embedded for loop but starting at 2 to m dividing first row
    alpha = A(2,1)/A(1,1);
    L(i,1) = alpha;
    A(i,:) = A(i,:) - alpha*A(1,:);
    alpha2 = 
end



for i = 2:n
%Pivoting again but for the second row now
% DO I NEED THIS? or just make 1's to i in first one
    col2 = A(:,2);
    [z,~] = max(col2);
    z = A(2,:);
    A(2,:) = A(max(col2),:);
    A(max(col1),:) = z;
end




%% NEED TO FIGURE OUT HOW TO PIVOT FOR BEFORE THIS
%Using LU factorization (figure out how to account for a value up to m)
L(2,1)= A(2,1)/A(1,1); %a21/a11 for L value
A1_n = L(2,1).*A(1,:); %Placeholder
A(1,:) = A1_n; %Setting a new value for A matrix
L(3,1)= A(3,1)/A(1,1); %a31/a11
A2_n = L(3,1).*A(2,:);
A(2,:) = A2_n;


%Back Substitution
x = zeros(m,n);
for i = m:-1:0
    x(i) = (A(i,end)-A(i,i+1:n)*x(i+1:n) )/A(i,i);
end

%CHECK MATLAB GRADER FOR INFO?