function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%
h=zeros(size(Y));
for i=1:size(X,1)
  for j=1:size(Theta,1)
    %if(R(i,j)==1)
    h(i,j)=h(i,j)+X(i,:)*Theta(j,:)';
    %endif
  
  endfor
endfor
sum=0;
for i=1:size(X,1)
  for j=1:size(Theta,1)
    if(R(i,j)==1)
    sum=sum+((h(i,j)-Y(i,j))^(2));
    
    endif
    
  endfor
endfor

J=sum/2;


for i=1:size(Theta,1)
  for j=1:size(Theta,2)
  J=J+(lambda/2)*(Theta(i,j)^(2));  
  endfor
endfor


for i=1:size(X,1)
  for j=1:size(X,2)
    J=J+(lambda/2)*(X(i,j)^(2));
  endfor
endfor

for i=1:size(X,1)
  for k=1:size(X,2)
    for j=1:size(Theta,1)
      if(R(i,j)==1)
      X_grad(i,k)=X_grad(i,k)+(h(i,j)-Y(i,j))*(Theta(j,k));
      endif
    endfor
  endfor
endfor
for i=1:size(X,1)
  for j=1:size(X,2)
    
    X_grad(i,j)=X_grad(i,j)+lambda*(X(i,j));
    
  endfor
endfor

for j=1:size(Theta,1)
   for k=1:size(X,2)
     for i=1:size(X,1)
       if(R(i,j)==1)
       Theta_grad(j,k)=Theta_grad(j,k)+(h(i,j)-Y(i,j))*(X(i,k));
       endif
    endfor
  endfor
endfor
for i=1:size(Theta,1)
  for j=1:size(Theta,2)
    
    Theta_grad(i,j)=Theta_grad(i,j)+lambda*(Theta(i,j));
    
  endfor
endfor

% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
