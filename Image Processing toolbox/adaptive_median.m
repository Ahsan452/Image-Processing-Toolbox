function [ output_image ] = adaptive_median( input_image )
f=im2double(input_image);
[m n]=size(f);
for i = 1:m
    for j =1:n
        Largest_mask = 1;
        continue_iteration = 1;
        while(continue_iteration == 1)
            array_number = 1;
            for k = i-Largest_mask:i+Largest_mask
                for p = j-Largest_mask:j+Largest_mask
                    if(k >0 && p>0)&&(k <m && p <n)
                        array_number = array_number+1;
                        array(array_number) = f(k,p);
                    end
                end
            end
            maximum_of_array = max(array);
            minimum_of_array = min(array);
            median_of_array = median(array);
            median_minus_minimum = median_of_array - minimum_of_array;
            median_minus_maximum = median_of_array - maximum_of_array;
            if (median_minus_minimum >0) && (median_minus_maximum <0)
                imPixel_minus_minimum = f(i,j) - minimum_of_array;
                imPixel_minus_maximum = f(i,j) - maximum_of_array;
                if (imPixel_minus_minimum > 0) && (imPixel_minus_maximum < 0)
                    output_image(i,j) = f(i,j);
                else
                    output_image(i,j) = median_of_array;
                end
                continue_iteration=0;
            else
                Largest_mask = Largest_mask+1;
                if Largest_mask>m
                    continue_iteration = 0;
                    output_image(i,j)=f(i,j);
                end
            end
            array=0;
        end
    end
end

output_image=uint8(output_image*255);
end

