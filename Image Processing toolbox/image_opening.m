function [ output_image ] = image_opening( input_image )
Image_eroded=image_erode(input_image);
output_image=image_dilate(Image_eroded);
end

