function [ output_image ] = image_erode( input_image )
[m n]=size(input_image);
output_image = zeros([m n]);
structure = [1 1 1;1 1 1; 1 1 1]; % structuring element
for i=2:m-1
    for j=2:n-1
        array_number=0;
        for p=j-1:j+1
            array_number=array_number+1;
            array(array_number)= input_image(i,p)*structure(array_number);
        end
        array_multiplied = 1;
        for r=1:array_number
            array_multiplied = array_multiplied*array(r);
        end
        if array_multiplied > 0
            output_image(i,j)=1;
        end
    end
end

end

