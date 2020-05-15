% Read Image
img_org = imread('checker_shadow_illusion.png');
%img_size = size(img_org);
%img_org = padarray(img_org,[60,60],0,'both');
figure();
imshow(img_org);
title('Input Image');
img = im2double(img_org);

% Calculate its Fourier Transform and shift origin to center 
img_F = fftshift(fft2(img));

% Spectrom and phase angle
img_spectrom = abs(img_F);
imwrite(log10(img_spectrom+1), 'p5b_b1_spectrum_of_input.png')
figure();
imshow(log10(img_spectrom+1));
title('Spectrum of input image');

% Phase angle
img_phase = angle(img_F);
%imwrite(img_phase, 'p5b_b1_phase_of_input.png')

% alter fourier: translate
img_F = imtranslate(img_F, [60, 0]);

% crop padded region
%img_spectrom = img_spectrom(20:end, :,:);
%img_phase = img_phase(20:end, :, :);

% Spectrom after altering
img_spectrom = abs(img_F);
imwrite(log10(img_spectrom+1), 'p5b_b1_spectrum_after_change.png')

figure();
imshow(log10(img_spectrom+1));
title('Spectrum after applying change');

% Inverse Fourier zero shift to left top
% and Inverse Fourier Transform
F_img = abs(ifft2(ifftshift(img_F)));

figure()
imshow(F_img)
title('Reconstructed Image')
imwrite(F_img, 'p5b_b1_reconstructed_image.png');

