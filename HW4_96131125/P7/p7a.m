% Read Image
img_org = imread('donald_and_father.jpg');
%img = rgb2gray(img_org);
img = im2double(img_org);
img_size = size(img_org);

% read filter
filt = fspecial('gaussian', 25, 2);
filt = im2double(filt);
filt_size = size(filt,1);

% pad filter
%filt = padarray(filt,[floor(size(img,1)/2), floor(size(img,2)/2)], 0);
filt = [filt zeros(size(filt,1), size(img,2)+1)];
filt = [filt; zeros(size(img,1)+1, size(filt,2))];

% pad image
% img = [img zeros(size(img,1), filt_size)];
% img = [img; zeros(filt_size, size(img,2))];
img = padarray(img,[floor(filt_size/2)+1, floor(filt_size/2)+1], 0);

% show image after padding
figure();
imshow(img_org);
title('Input Image');

% show filter after padding
figure();
imshow(filt);
title('filter');

% Calculate  Fourier Transform of image and shift origin to center 
img_F = fftshift(fft2(img));

% Spectrom and phase angle
img_spectrom = abs(img_F);
 
% Phase angle
img_phase = angle(img_F);
 
% Plot Spectrom and Phase Angle
figure();
imshow(log10(img_spectrom/300+1))
title('Spectrum')
%figure();
%imshow(img_phase)
%title('Phase')
%imwrite(log10(img_spectrom/300+1), 'p7a_spectrum.png');
%imwrite(img_phase, 'p7a_phase.png');

% Calculate Fourier Transform of filter
%H = fftshift(fft2(filt));
H = fftshift(fft2(filt));

% Spectrom and phase angle
H_spectrom = abs(H);
 
% Phase angle
H_phase = angle(img_F);
 
% Plot Spectrom and Phase Angle
figure();
imshow(log10(H_spectrom/1+1))
title('Spectrum of filter')

% apply wiener filter
K=0.02;
F_hat = ((H_spectrom.^2)./(((H_spectrom.^2)+K).*H)).* img_F;

% Inverse Fourier zero shift to left top
% and Inverse Fourier Transform
F_img = ifft2(ifftshift(F_hat));
F_img = abs(F_img);

% crop image
F_img = F_img(1:img_size(1), 1:img_size(2));

% get threshold
figure()
imshow(F_img)
imwrite(F_img, 'p7a_filtered_image.png')