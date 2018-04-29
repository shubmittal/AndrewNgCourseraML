function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%



t1 = (X*theta - y);


T1 = (t1'*t1)/(2*m);



Theta_subset = theta(2:end,: ); % excluse first column from regularization

T2 = (Theta_subset'*Theta_subset)*(lambda/(2*m));



J= T1+T2;

x0 = X(:,1);
x_rest = X(:, 2:end);


t3 = t1'*x0;

  
grad(1,:) = sum(t3,1)/(m);

%size(theta)
%size(t1)
%size(x_rest)
%size(Theta_subset)
%Theta_subset

grad(2:size(theta,1),1) = (x_rest'* t1) .* (1/m) + (lambda/m)*Theta_subset;



% =========================================================================

grad = grad(:);

end
