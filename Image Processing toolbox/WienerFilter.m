function [ output_image ] = WienerFilter( input_image, input_image_1 )
noise_mean = 0;
noise_var = 0.0001;
input_image_1=im2double(input_image_1);
LEN = 21;
THETA = 11;
PSF = fspecial('motion', LEN, THETA);
estimated_nsr = noise_var / var(input_image_1(:));
output_image = deconvwnr(input_image, PSF, estimated_nsr);

end

