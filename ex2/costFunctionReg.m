function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

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

z=X*theta;
h=sigmoid(z);
s=0;
for i=1:m
  
    J=J+(-1)*(y(i)*log (h(i)) +(1-y(i))*log (1-h(i)));
    
  
endfor

for j=2:n
  
  s=s+(theta(j)*theta(j));
    
  
endfor
J=J+(lambda/2)*s;
J=J/(m);

for j=1:n
  for i=1:m
    grad(j)=grad(j)+(h(i)-y(i))*X(i,j);
  endfor
  
endfor

for j=2:n
  grad(j)=(grad(j)+(lambda*theta(j)))/m;
endfor
grad(1)=grad(1)/m;
% =============================================================

end
