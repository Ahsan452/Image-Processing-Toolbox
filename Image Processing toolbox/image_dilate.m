function [ output_image] = image_dilate( input_image )
[m n]=size(input_image);
output_image = zeros([m n]);
structure = [1 1 1;1 1 1; 1 1 1]; % structuring element
for i=2:m-1
    for j=2:n-1
        array_number=0;
        for k=i-1:i+1
            for p=j-1:j+1
                array_number=array_number+1;
                array(array_number)= input_image(k,p)*structure(array_number);
            end
        end
        if sum(array) > 0
            output_image(i,j)=1;
        end
    end
end

end

