function [ output_image ] = average_filter( input_image )
input=inputdlg({'Order of Filter: ','Number of Times: '},'Average Filter',1,{'3','1'});
input_array=cell2mat(input);
order=str2num(input_array(1));
number=str2num(input_array(2));
output_image=input_image;
filter=1/(order*order)*ones(order);
for i=1:number
    output_image=imfilter(input_image,filter);
end
end

