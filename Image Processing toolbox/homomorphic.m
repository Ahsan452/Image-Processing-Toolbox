function [ output_image] = homomorphic( input_image)
PQ = paddedsize(size(input_image));

% Pad the image with Zeros

D0 = 10; %------------------------- Cutoff Frequency
%----------------------------------
u = 0:(PQ(1)-1); %|
v = 0:(PQ(2)-1); %|
idx = find(u > PQ(1)/2); %| Meshgrid frequency matrices
u(idx) = u(idx) - PQ(1); %| for use in distance computation
idy = find(v > PQ(2)/2); %|
v(idy) = v(idy) - PQ(2); %|
[V, U] = meshgrid(v, u); %|
%-------------------------------------------
D = sqrt(U.^2 + V.^2); % -------- Computing the Distance Matrix
%-------------------------------------------
c = 5;%-- Constant(Control the Sharpness of the slope of filter function)
GL=0.5; %------------------- Gamma Low (Less than one)
GH=1.1; %------------------- Gamma High (greater than one)
H = (GH-GL)*(1-(exp(-c*(D.^2)./(D0^2))))+GL; % Homomorphic Filter
H1 = fftshift(H); % Fourier version of Filter
%--------------------------------------------
F = fft2(input_image, size(H, 1), size(H, 2)); % Fourier version of Image
output_image = real(ifft2(H.*F)); % Multiplying filter Co-efficient with Image
% then takes the Inverse Fourier of Real Part
output_image = output_image(1:size(input_image, 1), 1:size(input_image, 2)); % Make the image in Original Size

end

