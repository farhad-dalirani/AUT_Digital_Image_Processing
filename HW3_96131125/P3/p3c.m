% Read Image
img_org = imread('parallel_man.jpg');
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
%figure();
%imshow(log10(img_spectrom+1))
%title('Spectrom')
figure();
imshow(histeq(log10(img_spectrom+1)))
title('Spectrum')
figure();
imshow(img_phase)
title('Phase')
imwrite(histeq(log10(img_spectrom+1)), 'p3c_parallel_man_spectrum.png');
imwrite(img_phase, 'p3c_parallel_man_phase.png');

% create filter - Horizontal notch band reject
filt = ones(size(img_F, 1), size(img_F, 2));
width = 10;
center_margin = 3;
for i=1:size(filt, 1)
   for j=1:size(filt, 2)
       if (i >= size(filt, 1)/2 - width) && (i <= size(filt, 1)/2 + width)
           if (j < size(filt, 2)/2 - center_margin) || (j > size(filt, 2)/2 + center_margin)
               filt(i, j) = 0;
           end
       end
   end
end
figure();
imshow(filt);
title(filt);
imwrite(filt, 'p3c_filter.png')

% apply filter by pairwise multiply fourier transform by filter
img_F = img_F .* filt;

% Inverse Fourier zero shift to left top
% and Inverse Fourier Transform
F_img = ifft2(ifftshift(img_F));
F_img = abs(F_img);

% Plot Reconstructed Image
figure()
imshow(F_img)
imwrite(F_img, 'p3c_filtered_image.png')
title('reconstruction of image from its Fourier Transform')