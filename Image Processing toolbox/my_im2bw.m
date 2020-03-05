function output_image = my_im2bw(input_image,level)
[X Y]=size(input_image);
for k=1:Y
  for i=1:X
    if input_image(i,k)>level
      output_image(i,k)=1;
    else
      output_image(i,k)=0;
    end
  end
end
% S = Ig;
% S(Ig > level) = 1;
% S(Ig <= level) = 0;
end