function centroids = kMeansInitCentroids(X, K)
%KMEANSINITCENTROIDS This function initializes K centroids that are to be 
%used in K-Means on the dataset X
%   centroids = KMEANSINITCENTROIDS(X, K) returns K initial centroids to be
%   used with the K-Means on the dataset X
%

% You should return this values correctly
centroids = zeros(K, size(X, 2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should set centroids to randomly chosen examples from
%               the dataset X
%
ran=zeros(K,1);
    for i=1:K
      ran(i)=randi(K);
      for j=1:i-1
        if(ran(j)==rand(i))
        ran(i)=randi(K);
        endif
      endfor 
      centroids(i,:)=X(ran(i),:);
    endfor
    
  







% =============================================================

end

