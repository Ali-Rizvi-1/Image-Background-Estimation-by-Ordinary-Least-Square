% Background estimation by least square 

img = im2double(imread("angiography_live_image.tif"));

z_est = PolynomialSurfaceFitting(img);