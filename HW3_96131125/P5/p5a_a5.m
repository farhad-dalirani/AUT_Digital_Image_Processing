% Read Image
img_org = imread('café_wall_illusion.png');
% pad image by zero, for avoiding effect of conclution
img_org = padarray(img_org,[300, 300],0,'both');

figure();
imshow(img_org);
title('Input Image');
imwrite(img_org, 'a-a5-input.png');

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
imwrite(log10(img_spectrom+1), 'a-a5-spectrum.png');

% shearing image
a = 0.45;
black = [0 0 0]';
T = maketform('affine', [1 0 0; a 1 0; 0 0 1] );
R = makeresampler({'cubic','nearest'}, 'fill');
img_edited = imtransform(img_org,T,R, 'FillValues',black);
img_edited = img_edited(:, 221:1421,:);

figure();
imshow(img_edited);
title('shearing Image');
imwrite(img_edited, 'a-a5-shearing.png');

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
title('Spectrom of shearing image')
figure();
imshow(img_phase)
title('Phase of shearing image')
imwrite(log10(img_spectrom_edited+1), 'a-a5-spectrum-shearing.png');
