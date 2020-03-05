function [ output_image ] = canny_edge( input_image )
output_image=edge(input_image,'Canny');

end
