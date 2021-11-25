function [Z_est] = PolynomialSurfaceFitting(input_matrix)
%2ndPolynomialSurfaceFitting Summary of this function goes here
% Fitting a second degree polynomial to an input matrix(image)

% img = im2double(imread("angiography_live_image.tif"));
% imshow(img);
[r0,c0] = size(input_matrix);
X = zeros(r0*c0,1);
Y = zeros(r0*c0,1); 
Z = zeros(r0*c0,1);

a=1;

for i=1:r0
    
    for j=1:c0
        
        Y(a,1) = i; % contains row
        X(a,1) = j; % contains column
        Z(a,1) = input_matrix(i,j);
        
        a=a+1;
    end
    
end

% constructing the H-matrix
H = zeros(r0*c0,6);

for i=1:r0*c0
    H(i,:) = [1 X(i) Y(i) X(i)*X(i) Y(i)*Y(i) X(i)*Y(i)];
end

% Parameters
a_hat = inv(H'*H)*transpose(H)*Z;

Z_est = H *a_hat;

end

