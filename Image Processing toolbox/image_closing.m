function [ output_image ] = image_closing( input_image )
Image_dilated=image_dilate(input_image);
output_image=image_erode(Image_dilated);
end

