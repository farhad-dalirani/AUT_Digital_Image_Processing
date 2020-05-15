% Read Image
img_org = imread('a/a3.png');
figure();
imshow(img_org);
title('Input Image');

img = rgb2gray(img_org);
img = im2double(img);

% Calculate its Fourier Transform and shift origin to center 
img_F = fftshift(fft2(img));    
 
% Spectrom and phase angle
img_spectrom = abs(img_F);
 
% Phase angle
img_phase = angle(img_F);
 
% Plot Spectrom and Phase Angle
figure();
imshow(log(img_spectrom+1))
title('Spectrom')
figure();
imshow(img_phase)
title('Phase')
imwrite(log(img_spectrom+1), 'a/a3-spectrum.png');

% Inverse Fourier zero shift to left top
% and Inverse Fourier Transform
F_img = ifft2(ifftshift(img_F));
 
% Plot Reconstructed Image
figure()
imshow(F_img)
title('reconstruction of image from its Fourier Transform')