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

% for debugging
% x1plot = linspace(-2, 2, 10)';
% x2plot = linspace(-2, 2, 10)';
% [X1, X2] = meshgrid(x1plot, x2plot);
% X = [X1(:) X2(:)];
% Xval = X + 0.3;
% y = double(sum(exp(X),2) > 3);
% yval = double(sum(exp(Xval),2) > 3);
% [C sigma] = dataset3Params(X, y, Xval, yval)


% parameters' initilisation
multiplier = 0.1;
StartC = 0.1;
StartSigma = 0.1;
iteration = 10;


% create vector for parameters
VectorC = [StartC;zeros(iteration - 1 , 1)];
VectorSigma = [StartSigma;zeros(iteration - 1 , 1)];
for i = 2:iteration,
    VectorC(i) = VectorC(i-1) + multiplier;
    VectorSigma(i) = VectorSigma(i-1) + multiplier;
end;

% train and predict
MatrixError = zeros(iteration, iteration);
for c = 1:iteration,
    for s = 1:iteration,
        model = svmTrain(X, y, VectorC(c), @(x1, x2) gaussianKernel(x1, x2, VectorSigma(s)));
        pred = svmPredict(model, Xval);
        MatrixError(c,s) = mean(double(pred ~= yval));
    end;
end;

[min_c, ix_c] = min(MatrixError);
[min_s, ix_s] = min(min_c);

C = VectorC(ix_c(1));
sigma = VectorSigma(ix_s);

% =========================================================================

end
