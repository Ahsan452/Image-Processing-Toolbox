function [ output_image ] = alpha_trim( input_image )
input=inputdlg({'Order of Filter: ','Trim Size : '},'Alpha Trim Filter',1,{'3','2'});
input_array=cell2mat(input);
masksize=str2num(input_array(1));
D=str2num(input_array(2))*2;
[m n]=size(input_image);
output_image=input_image;
d = D/2;
p=(masksize-1)/2;
q=(masksize-1)/2;
for i=p+1:m-p
	for j=q+1:n-q
		mask_array=zeros(masksize);
        for k=-p: p
            for l=-q:q
                mask_array(p+1-k,q+1-l)=input_image(i-k,j-l);
            end
        end
        array=mask_array(:);
        array = sort(array);
        r = (size(array)-d);
        s1= array(d+1:r);
        output_image(i,j)= sum(s1)/(size(mask_array,1)*(size(mask_array,2))-D);
    end
end

end

