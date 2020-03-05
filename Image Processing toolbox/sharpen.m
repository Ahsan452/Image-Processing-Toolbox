function [ output_image ] = sharpen( input_image)
input=inputdlg({'Alpha Value of Laplacian: '},'Laplacian Filter',1,{'.2'});
input_array=cell2mat(input);
alpha=str2num(input_array);
if (alpha>1)
    alpha=1;
else if (alpha<0)
        alpha=0;
    else
        alpha=alpha;
    end
end
output_image=input_image;
filter=fspecial('laplacian',alpha);
laplace_image=(imfilter(input_image,filter));
output_image=input_image-laplace_image;
end

