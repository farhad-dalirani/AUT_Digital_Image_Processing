% Read Image
img_org = imread('café_wall_illusion.png');
% pad image by zero, for avoiding effect of conclution
img_org = padarray(img_org,[30, 30],0,'both');

figure();
imshow(img_org);
title('Input Image');
imwrite(img_org, 'a-a2-input.png');

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
imwrite(log10(img_spectrom+1), 'a-a2-spectrum.png');

% translation image
img_edited = imtranslate(img_org, [10, 0]);
figure();
imshow(img_edited);
title('translation Image');
imwrite(img_edited, 'a-a2-translation.png');

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
title('Spectrom of translation image')
figure();
imshow(img_phase)
title('Phase of translation image')
imwrite(log10(img_spectrom_edited+1), 'a-a2-spectrum-translation.png');
