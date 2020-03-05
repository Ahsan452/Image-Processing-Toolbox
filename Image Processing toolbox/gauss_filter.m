function [ output_image ] = gauss_filter( input_image )
input=inputdlg({'Order of Filter: '},'Gaussian Filter',1,{'3'});
input_array=cell2mat(input);
order=str2num(input_array);
output_image=input_image;
filter=fspecial('gaussian',order,.5);
output_image=imfilter(input_image,filter);
end


