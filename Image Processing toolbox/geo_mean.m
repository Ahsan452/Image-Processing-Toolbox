function [ output_image ] = geo_mean( input_image )
input=inputdlg({'Order of Filter: '},'Geometeric Mean Filter',1,{'1'});
input_array=cell2mat(input);
mask=floor(str2num(input_array(1))/2);
[m n]=maskze(input_image);
output_image=input_image;
input_image=double(input_image);
for i = 1:m
    for j = 1:n 
    array_number=0; 
    array_multiplied=1;
        for k1 = i-mask:i+mask
            for p1 = j-mask:j+mask
                if ((k1 > 0 && p1 > 0) && (k1 < m && p1 < n ))
                    array_number = array_number+1;
                    array_multiplied=array_multiplied*input_image(k1,p1);
                end
            end
        end
        output_image(i,j)=array_multiplied^(1/array_number);
    end 
end


end

