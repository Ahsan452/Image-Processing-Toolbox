function [ output_image ] = midpoint( input_image )
[m n]=size(input_image);
input=inputdlg({'Order of Filter: '},'Maximum Filter',1,{'3'});
input_array=cell2mat(input);
order=str2num(input_array);
p=(order-1)/2;
q=(order-1)/2;
% c=ones(order)/(order^2);
% [p q]=size(c);
% p=(p-1)/2;
% q=(q-1)/2;
output_image=input_image;
for i=p+1:m-p
	for j=q+1:n-q
		mask_array=zeros(order);
		for k=-p: p
			for l=-q: q
				mask_array(p+1-k,q+1-l)=input_image(i-k,j-l);
			end
		end
		Array=mask_array(: );
		middle_value=(min(Array)+max(Array))/2;
		output_image(i,j)=middle_value;
	end
end


end

