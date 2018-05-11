function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a records
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

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

sum_records = zeros(K,n);
count_records = zeros(K,1);

for i = 1:m
 x = X(i,:);
 assigned_index = idx(i,1);
 sum_records(assigned_index,:) = sum_records(assigned_index,:)+ x;
 count_records(assigned_index,1) = count_records(assigned_index,1)+1;
 endfor

 for i = 1:K
  num_records = count_records(i,1);
  if ( num_records == 0)
   continue
  endif
  mean_centroid = sum_records(i, :)/num_records;
  centroids(i,:) = mean_centroid;
  endfor   
  


% =============================================================


end

