function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
gamma = 0;
for g = 2 : size(theta)
    gamma = gamma + theta(g)^2;
end

% gamma = theta(2:size(theta,1))'*theta(2:size(theta,1))

J = J - 1/m * (y'*log(sigmoid(X*theta)) + (1-y)'*log(1-sigmoid(X*theta))) + lambda/(2*m)*gamma;

grad(1) = grad(1) + 1/m*X(:,1)'*(sigmoid(X*theta)-y);

for i = 2 : size(theta)
    grad(i) = grad(i) + theta(i)*(lambda/m) + 1/m*X(:,i)'*(sigmoid(X*theta)-y);
end    

% =============================================================

end
