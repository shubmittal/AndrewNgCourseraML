function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

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

multiplier = 3;

num_C_iterations = 10;
initial_C = 0.01;

num_sigma_iterations = 10;
initial_sigma = 0.01;

max_error = inf;
C_optimal = 0;
sigma_optimal = 0;


for iteration_C = 1:num_C_iterations

val_C =  initial_C * (multiplier^iteration_C);
 for iteration_sigma = 1:num_sigma_iterations
 val_sigma = initial_sigma*(multiplier^iteration_sigma);
 
 

 [model] = svmTrain(X, y, val_C, @(X, y) gaussianKernel(X,y, val_sigma));
 predictions = svmPredict(model,Xval);
 error =  mean(double(predictions ~= yval));
 fprintf("For C= %f and sigma = %f, the error was %f",val_C, val_sigma, error);
 if (error < max_error)
 {
   max_error = error;
   C_optimal = val_C;
   sigma_optimal = val_sigma;
 } 
 end
end

C = C_optimal;
sigma = sigma_optimal; 
 
 
% =========================================================================

end
