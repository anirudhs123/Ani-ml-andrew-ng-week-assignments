function [params, J_history] = gradientdescent(X, Y, Theta,R,alpha,...
                    num_iters, lambda)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(Y); % number of training examples
J_history = zeros(num_iters, 1);
num_users = size(Y, 2);
num_movies = size(Y, 1);
num_features = 10;
params=[X(:); Theta(:)];
for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    
    
    Theta_grad=zeros(size(params));
    [J_history(iter), Theta_grad]=cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda);
    params=params-(alpha)*(1/m)*(Theta_grad);





    % ============================================================

    % Save the cost J in every iteration    
    

end

end
