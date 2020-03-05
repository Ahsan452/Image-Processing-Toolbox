function [ output_image ] = convexhull( input_image )
o=input_image;
% [r,c]=size(input_image);
c=[1 0 0;1 0 0;1 0 0 ] 
c1=[1 1 1;0 0 0;0 0 0 ];
c2=[0 0 1; 0 0 1;0 0 1];
c3=[0 0 0;0 0 0;1 1 1];
b=input_image;
for u=1:10
d=(imerode(b,c))|input_image;
if(b==d)
break;
end
b=d;
end
%-------------
m=input_image;
for u=1:10
n=(imerode(m,c1))|input_image;
if(m==n)
break;
end
m=n;
end

%-------------
p=input_image;
for u=1:10
l=(imerode(p,c2))|input_image;
if(p==l)
break;
end
p=l;
end

%-------------
z=input_image;
for u=1:10
v=(imerode(z,c3))|input_image;
if(z==v)
break;
end
z=v;
end

%-------------
output_image=z|p|m|b;

end

