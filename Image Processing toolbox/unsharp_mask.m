function [ output_image ] = unsharp_mask( input_image )
input=inputdlg({'Order of Filter: ','Value of k: '},'Unsharp Masking',1,{'3','1'});
input_array=cell2mat(input);
order=str2num(input_array(1));
value=str2num(input_array(2));

average_image=input_image;
filter=1/(order*order)*ones(order);
average_image=imfilter(input_image,filter);
difference_image=input_image-average_image;
output_image=input_image+value*difference_image;

end

