function [ output_image ] = robert_edge( input_image )
% output_image=edge(input_image,'Roberts');

output_image=(input_image);

C=double(output_image);


for i=1:size(C,1)-2
    for j=1:size(C,2)-2
        %Robert mask for 45-direction:
        Gx=(C(i+2,j+1)-C(i+1,j+2));
        %Robert mask for -45-direction:
        Gy=(C(i+2,j+2)-C(i+1,j+1));
      
        %The gradient of the image
        %B(i,j)=abs(Gx)+abs(Gy);
        output_image(i,j)=sqrt(Gx.^2+Gy.^2);
      
    end
end

end

