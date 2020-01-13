function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta,1),1);
h=zeros(m,1);
cost=zeros(m,1);
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
h=X*(theta);

for i=1:m
  J=J+((h(i)-y(i))*(h(i)-y(i)));
endfor


for i=2:size(theta,1)
  J=J+(lambda)*(theta(i))*(theta(i));
endfor
J=J/(2*m);


for i=1:m
  for j=1:size(theta,1)
    grad(j)=grad(j)+(h(i)-y(i))*(X(i,j));
  endfor
endfor


for i=1:size(theta,1)
  grad(i)=grad(i)/m;
endfor


for  j=2:size(theta,1)
  grad(j)=grad(j)+(lambda/m)*(theta(j));
endfor








% =========================================================================

grad = grad(:);

end
