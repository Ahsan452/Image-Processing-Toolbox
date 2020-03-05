function [ output_image ] = hitmiss( input_image )
[r c]=size(input_image);
D=[ 0 0 0 1 0 0 0;
    0 0 1 1 1 0 0; 
    0 1 1 1 1 1 0;
    1 1 1 1 1 1 1];
[rd cd]=size(D);
WminusD=zeros(rd+2,cd+2);
for i=2:rd+1
    for j=2:cd+1
        WminusD(i,j)=D(i-1,j-1);
    end
end
 x=0;y=0;
 % as we know hit miss tranformation is given by A*B=(A erosion D(structure
% we wana find))intersection (Ac erosion(W-D))
        AeroD = imerode(input_image,D);
        imagecomp=bitcmp(input_image,1);
        ero2=imerode(imagecomp,WminusD);
        output_image=AeroD+ero2;
        for i=2:r-1
            for j=2:c-1
                if([output_image(i-1,j-1) output_image(i-1,j) output_image(i-1,j+1);
                    output_image(i,j-1) output_image(i,j) output_image(i,j+1);
                    output_image(i+1,j-1) output_image(i+1,j) output_image(i+1,j+1)]==[0 0 0
                    0 1 0
                    0 0 0])
                x=i;y=j;
                end
            end
        end
        for i=1:r
            for j=1:c
                if(i==x && j==y)
                    output_image(i,j)=1;
                else
                    output_image(i,j)=0;
                end
            end
        end
end

