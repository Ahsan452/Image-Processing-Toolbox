function [ output_image ] = watershedseg( input_image )
hy = fspecial('sobel');
hx = hy';
Iy = imfilter(double(input_image), hy, 'replicate');
Ix = imfilter(double(input_image), hx, 'replicate');
gradmag = sqrt(Ix.^2 + Iy.^2);
L = watershed(gradmag);
se = strel('disk', 20);
Io = imopen(input_image, se);
Ie = imerode(input_image, se);
Iobr = imreconstruct(Ie, input_image);
Ioc = imclose(Io, se);
Iobrd = imdilate(Iobr, se);
Iobrcbr = imreconstruct(imcomplement(Iobrd), imcomplement(Iobr));
Iobrcbr = imcomplement(Iobrcbr);
fgm = imregionalmax(Iobrcbr);
I2 = input_image;
I2(fgm) = 255;
se2 = strel(ones(5,5));
fgm2 = imclose(fgm, se2);
fgm3 = imerode(fgm2, se2);
fgm4 = bwareaopen(fgm3, 20);
I3 = input_image;
I3(fgm4) = 255;
bw = im2bw(Iobrcbr);
D = bwdist(bw);
DL = watershed(D);
bgm = DL == 0;
gradmag2 = imimposemin(gradmag, bgm | fgm4);
L = watershed(gradmag2);
I4 = input_image;
I4(imdilate(L == 0, ones(3, 3)) | bgm | fgm4) = 255;
output_image = label2rgb(L, 'jet', 'w', 'shuffle');
end

