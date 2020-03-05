function [ output_image ] = Histogram_Equalize( input_image )
[x,y] = size(input_image);
Histogram = zeros(1,256);
for i=1:x
   for j=1:y
       Histogram(input_image(i,j)+1) = Histogram(input_image(i,j)+1) + 1;
   end
end
Histogram_1=Histogram/(x*y);
Cummulative=cumsum(Histogram_1)*255;
output_image=uint8(zeros(x,y));
for i=1:x
    for j=1:y
            output_image(i,j)=Cummulative(input_image(i,j)+1);
    end
end

end

