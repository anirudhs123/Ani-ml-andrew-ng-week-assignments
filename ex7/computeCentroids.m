function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);
temp=zeros(K,1);
% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%
for i=1:size(idx,1)
  for j=1:K
    if(idx(i)==j)
    temp(j)=temp(j)+1;
    endif
  endfor
endfor


temp_sum=zeros(K,n);

for i=1:m
  for j=1:n
    for k=1:K
      if(idx(i)==k)
      temp_sum(k,j)=temp_sum(k,j)+X(i,j);
      endif
    endfor
  endfor
endfor
for i=1:K
  for j=1:n
    centroids(i,j)=temp_sum(i,j)/temp(i);
  endfor
endfor





% =============================================================


end

