% Read Image
img_org = imread('café_wall_illusion.png');
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
imshow(log10(img_spectrom+1))
title('Spectrom')
figure();
imshow(img_phase)
title('Phase')
imwrite(log10(img_spectrom+1), 'a-a1-spectrum.png');

% reflecting image
img_edited = img_org(:, size(img_org,2):-1:1,:);
figure();
imshow(img_edited);
title('Reflected Image');
imwrite(img_edited, 'a-a1-reflected.png');


img = rgb2gray(img_edited);
img = im2double(img);

% Calculate its Fourier Transform and shift origin to center 
img_F = fftshift(fft2(img));    
 
% Spectrom and phase angle
img_spectrom_edited = abs(img_F);
 
% Phase angle
img_phase = angle(img_F);
 
% Plot Spectrom and Phase Angle
figure();
imshow(log10(img_spectrom_edited+1))
title('Spectrom of reflected image')
figure();
imshow(img_phase)
title('Phase of reflected image')
imwrite(log10(img_spectrom_edited+1), 'a-a1-spectrum-reflected.png');
