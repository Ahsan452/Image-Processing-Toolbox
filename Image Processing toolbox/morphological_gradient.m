function [ output_image ] = morphological_gradient( input_image )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
output_image=image_dilate(input_image)-image_erode(input_image);

end

