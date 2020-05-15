clear;clc;

% Read Image
img_org = imread('café_wall_illusion.png');
% pad image by zero, for avoiding effect of conclution
img_org = padarray(img_org,[200,200],0,'both');

figure();
imshow(img_org);
title('Input Image');
imwrite(img_org, 'a-a3-input.png');

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
imwrite(log10(img_spectrom+1), 'a-a3-spectrum.png');

degree_for_rotate = [45, 90, 180];
for i=1:3
    % rotate image
    img_edited = imrotate(img_org, degree_for_rotate(i), 'crop');
    figure();
    imshow(img_edited);
    title('rotated Image');
    imwrite(img_edited, strcat('a-a3-rotate-', num2str(degree_for_rotate(i)),'.png'));

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
    title('Spectrom of rotated image')
    figure();
    imshow(img_phase)
    title('Phase of rotated image')
    imwrite(log10(img_spectrom_edited+1),  strcat('a-a3-spectrum-rotate-', num2str(degree_for_rotate(i)),'.png'));
end