function [ output_image ] = prewitt_edge( input_image )
% output_image=edge(input_image,'Prewitt');
% [m n]=size(input_image);
% N(1:m,1:n)=0;
% for i=1:m-2;
%     for j=1:m-2;
%         N(i,j)=-1*input_image(i,j)-1*input_image(i,j+1)-1*input_image(i,j+2)+0+0+0+1*input_image(i+2,j)+1*input_image(i+2,j+1)+1*input_image(i+2,j+2);
%     end
% end
% O(1:m,1:n)=0;
% for i=1:m-2;
%     for j=1:m-2;
%         O(i,j)=-1*input_image(i,j)+0+1*input_image(i,j+2)-1*input_image(i+2,j)+0+1*input_image(i+1,j+2)-1*input_image(i+2,j)+0+1*input_image(i+2,j+2);
%     end
% end
% output_image=uint8(zeros(m,n));
% output_image=N+O;
output_image=(input_image);

C=double(output_image);


for i=1:size(C,1)-2
    for j=1:size(C,2)-2
        %Prewitt mask for x-direction:
        Gx=((C(i+2,j+1)+C(i+2,j)+C(i+2,j+2))-(C(i,j+1)+C(i,j)+C(i,j+2)));
        %prewitt mask for y-direction:
        Gy=((C(i+1,j+2)+C(i,j+2)+C(i+2,j+2))-(C(i+1,j)+C(i,j)+C(i+2,j)));
      
        %The gradient of the image
        %B(i,j)=abs(Gx)+abs(Gy);
        output_image(i,j)=sqrt(Gx.^2+Gy.^2);
      
    end
end
end

