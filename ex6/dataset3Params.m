function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.

C1 = [2^(-5),2^(-3),2^(-1),2^(1),2^(1.5),2^(2),1.5,0.4,2^(0),.05];
sigma1 =[2^(-5),2^(-3),2^(-1),2^(1),2^(2),2^(1.5),.2,.4,8,2^(2.5)];

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

error=zeros(size(C1,2),size(sigma1,2));
for i=1:size(C1,2)
  for j=1:size(sigma1,2)
    model= svmTrain(X, y, C1(i), @(x1, x2) gaussianKernel(x1, x2, sigma1(j)));
    predictions = svmPredict(model, Xval);
    error(i,j)=mean(double(predictions ~= yval))
  endfor
endfor
C=0;
sigma=0;
min_error=min(error);
min_min=min(min_error);


for i=1:size(C1,2)
  for j=1:size(sigma1,2)
    if(min_min==error(i,j))
     C=C1(i);
     imin=i;
     sigma=sigma1(j);
       jmin=j;
    endif
  endfor
endfor





% =========================================================================

end
