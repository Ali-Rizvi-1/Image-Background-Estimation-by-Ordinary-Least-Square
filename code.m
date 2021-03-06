% Background estimation by least square 
clc;clear; close all;

% reading the image angiography as double
img = im2double(imread("angiography_live_image.tif"));
[r0,c0] = size(img);

% Finding coefficients for second degree polynomial
% surface fitting
z_est = PolynomialSurfaceFitting(img,r0,c0); 

% Recreating the image according the estimated Z
est_image = zeros(r0,c0);
b = 1;
for i=1:r0
    for j=1:c0
        est_image(i,j) = z_est(b,1);       
        b = b+1;        
    end
end

subplot 121
imshow(img); title('Original Image');
subplot 122
imshow(est_image); title('Estimated image using 2nd degree polynomial')

imwrite(est_image, "EstimatedImage.jpg", "Quality", 100) 