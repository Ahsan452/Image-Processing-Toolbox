function [ output_image] = adaptive_mean( input_image )
input_image=im2double(input_image);
[m n]=size(input_image);
output_image=zeros(m,n);
image_standard_deviation = std2(input_image); % For Standard Deviation
image_mean = mean2(input_image); % For Mean
for i=2:m-1
    for j=2:n-1
        array_number=0; array_sum=0; array=0;
        for k=i-1:i+1
            for p=j-1:j+1
                array_number=array_number+1;
                array_sum = array_sum+input_image(k,p);
                array(array_number)=input_image(k,p);
            end
        end
        local_mean=array_sum/array_number;
        local_standard_deviation = std(array);
        if local_standard_deviation >0
            output_image(i,j) = input_image(i,j)-(image_standard_deviation/local_standard_deviation*(input_image(i,j)-local_mean));
        else
            output_image(i,j) = input_image(i,j);
        end
    end
end
% output_image=uint8(output_image*255);

end

