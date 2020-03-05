function [ output_image] = addnoiseweiner( input_image)
LEN = 21;
THETA = 11;
PSF = fspecial('motion', LEN, THETA);
input_image=im2double(input_image);
output_image = imfilter(input_image, PSF, 'conv', 'circular');
noise_mean = 0;
noise_var = 0.0001;
output_image = imnoise(output_image, 'gaussian', noise_mean, noise_var);


end

