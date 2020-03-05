function [ output_image ] = contra_mean( input_image )


input=inputdlg({'Mask maskze of filter (1-3): ','R of filter: '},'Contraharmonic Filter',1,{'1','0'});
input_array_1={'0','0'};
input_array=cell2mat(input(1));
input_array_1=cell2mat(input(2));
mask=str2num(input_array(1));

Q=str2num(input_array_1(1));
if (numel(input_array_1)==2)
    R=str2num(input_array_1(2));
    Q=-R;
end
input_image=im2double(input_image);
% Order of the filter
[m n]=size(input_image);
for i = 1:m
    for j = 1:n
        denominator=0; numerator=0;
        for k1 = i-mask:i+mask
            for p1 = j-mask:j+mask
                if ((k1>0 && p1 >0) && (k1<m && p1<n))
                    denominator=denominator+(input_image(k1,p1)^Q); 
                    numerator=numerator+(input_image(k1,p1)^(Q+1));
                end
            end
        end
        output_image(i,j)=numerator/denominator;
    end
end


end

