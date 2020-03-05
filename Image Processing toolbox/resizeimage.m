function [ output_image ] = resizeimage( input_image )
input=inputdlg({'Image Resize Ratio: '},'Image Resize',1,{'1'});
input_array=cell2mat(input);
ratio=str2num(input_array);
output_image=imresize(input_image,ratio,'bilinear');


end

