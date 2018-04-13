function p = predictOneVsAll(all_theta, X)
%PREDICT Predict the label for a trained one-vs-all classifier. The labels 
%are in the range 1..K, where K = size(all_theta, 1). 
%  p = PREDICTONEVSALL(all_theta, X) will return a vector of predictions
%  for each example in the matrix X. Note that X contains the examples in
%  rows. all_theta is a matrix where the i-th row is a trained logistic
%  regression theta vector for the i-th class. You should set p to a vector
%  of values from 1..K (e.g., p = [1; 3; 1; 2] predicts classes 1, 3, 1, 2
%  for 4 examples) 

m = size(X, 1);
num_labels = size(all_theta, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters (one-vs-all).
%               You should set p to a vector of predictions (from 1 to
%               num_labels).
%
% Hint: This code can be done all vectorized using the max function.
%       In particular, the max function can also return the index of the 
%       max element, for more information see 'help max'. If your examples 
%       are in rows, then, you can use max(A, [], 2) to obtain the max 
%       for each row.
%   
% the key to solving this problem is in week 3 , where it says that to make prediction pick i which maximized the hypothesis. 
% Usage of [maxvals, indexes] = max(A, [], dim)  . what this means is that take matrix A, return me the maximum for dimension specified by dim.
% if dim =1, then maxvals will be a row vector consisting of max of each column and indexes will also be a row vector specifying the rows in which that max occured for a given column
% if dim =2, then maxvals will be a column vector consisting of max of each row and indexes will also be a column vector specifying the column in which that max occured for a given row
% Each row in p_all represents the hypothesis for a given value of thetas which is a single row in all_theta. If p represents the probability,then we need to find that what is the maximum probability
 

 
 p_all = (X*all_theta');
 
 
 [p_s, i_max] = max(p_all, [], 2);

 
 p = i_max;
 
 





% =========================================================================


end
