% Read Image
img_org = imread('trump_truck_driving.jpg');
%img = rgb2gray(img_org);
img = im2double(img_org);
%img = img(:,:,1);
img_size = size(img);

% read filter
filt = fspecial('motion', 30, 0);
filt = im2double(filt);
filt_size = size(filt);

% pad filter
%filt = padarray(filt,[floor(size(img,1)/2), floor(size(img,2)/2)], 0);
filt = [filt zeros(size(filt,1), size(img,2)+1)];
filt = [filt; zeros(size(img,1)+1, size(filt,2))];

% pad image
% img = [img zeros(size(img,1), filt_size)];
% img = [img; zeros(filt_size, size(img,2))];
img = padarray(img,[floor(filt_size(1)/2)+1, floor(filt_size(2)/2)+1], 0);

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
H_hat = ((H_spectrom.^2)./(((H_spectrom.^2)+K).*H));
H_hat_3 = zeros(size(H_hat,1), size(H_hat,2), 3);
H_hat_3(:,:,1) = H_hat;
H_hat_3(:,:,2) = H_hat;
H_hat_3(:,:,3) = H_hat;
F_hat = H_hat_3 .* img_F;

% Inverse Fourier zero shift to left top
% and Inverse Fourier Transform
F_img = ifft2(ifftshift(F_hat));
F_img = abs(F_img);

% crop image
F_img = F_img(1:img_size(1), 1:img_size(2),:);

% get threshold
figure()
imshow(F_img)
imwrite(F_img, 'p7b_filtered_image.png')