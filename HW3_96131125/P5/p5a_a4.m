clear;clc;

% Read Image
img_org = imread('café_wall_illusion.png');
% pad image by zero, for avoiding effect of conclution
%img_org = padarray(img_org,[200,200],0,'both');

figure();
imshow(img_org);
title('Input Image');
%imwrite(img_org, 'a-a4-input.png');

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
imwrite(log10(img_spectrom+1), 'a-a4-spectrum.png');

amount_for_scale = [0.5, 2];
for i=1:2
    % scale image
    img_edited = imresize(img_org, amount_for_scale(i));
    figure();
    imshow(img_edited);
    title('scaled Image');
    imwrite(img_edited, strcat('a-a4-scaled-', num2str(amount_for_scale(i)),'.png'));

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
    title('Spectrom of scaled image')
    figure();
    imshow(img_phase)
    title('Phase of scaled image')
    imwrite(log10(img_spectrom_edited+1),  strcat('a-a4-spectrum-scaled-', num2str(amount_for_scale(i)),'.png'));
end