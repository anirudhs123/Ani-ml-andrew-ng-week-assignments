function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
%m = length(y); % number of training examples
[m,n]=size(X);
% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
z=zeros(m,1);
h=zeros(m,1);
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%
z=X*theta;
h=sigmoid(z);
for i=1:m
  
  J=J+(-1)*(y(i)*log (h(i)) +(1-y(i))*log (1-h(i)));
    
  
endfor
J=J/m;
for j=1:n
  for i=1:m
    grad(j)=grad(j)+(h(i)-y(i))*X(i,j);
  endfor
  
endfor

for j=1:n
  grad(j)=grad(j)/m;
endfor







% =============================================================

end
