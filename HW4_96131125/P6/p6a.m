% Read Image
img_org = imread('curiosity_rover_selfie.png');
figure();
imshow(img_org);
title('Input Image');

%img = rgb2gray(img_org);
img = im2double(img_org);

% Calculate its Fourier Transform and shift origin to center 
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
imwrite(log10(img_spectrom/300+1), 'p6a_spectrum.png');
%imwrite(img_phase, 'p7a_phase.png');

% create filter for all peaks- notch reject
filt = ones(size(img_F, 1), size(img_F, 2));
% location of impusle peak
u0 = -46;
v0 = -45;
% radius of Notch
D0 = 10;
for i=1:size(filt,1)
    for j=1:size(filt,2)
        % distance from two impulses 
        D1 = sqrt((i-floor(size(filt,1)/2)-u0)^2 + (j-floor(size(filt,2)/2)-v0)^2);
        D2 = sqrt((i-floor(size(filt,1)/2)+u0)^2 + (j-floor(size(filt,2)/2)+v0)^2);
        
        if D1 <= D0 || D2 <= D0
            filt(i, j) = 0;
        else
            filt(i, j) = 1;
        end
    end
end


figure();
imshow(filt);
title(filt);
imwrite(filt, 'p6a_filter.png')

% apply filter by pairwise multiply fourier transform by filter
img_F = img_F .* filt;

% Inverse Fourier zero shift to left top
% and Inverse Fourier Transform
F_img = ifft2(ifftshift(img_F));
F_img = abs(F_img);

% Plot Reconstructed Image
figure()
imshow(F_img)
imwrite(F_img, 'p6a_filtered_image.png')
title('reconstruction of image from its Fourier Transform')