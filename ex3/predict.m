function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
[m] = size(X,1);
num_labels = size(Theta2, 1);
X=[ones(m,1) X];

% You need to return the following variables correctly 
p = zeros(m, 1);
z1=Theta1*(X');
for i=1:size(z1,1)
  for j=1:size(z1,2)
    z1(i,j)=sigmoid(z1(i,j));
  endfor
endfor
z1=z1';
z1=[ones(size(z1,1),1) z1];

z2=Theta2*(z1');
for i=1:size(z2,1)
  for j=1:size(z2,2)
    z2(i,j)=sigmoid(z2(i,j));
  endfor
endfor

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

maxcol=max((z2));
for i=1:m
  for j=1:num_labels
    if(maxcol(i)==z2(j,i))
    p(i)=(j);
    endif
    
  endfor
endfor






% =========================================================================

   

end
