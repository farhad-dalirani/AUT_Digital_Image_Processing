% Read Image
img_org = imread('nasir_receiving_pachekhari.jpg');
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
imshow(histeq(log10(img_spectrom/100+1)))
title('Spectrum')
figure();
imshow(img_phase)
title('Phase')
imwrite(histeq(log10(img_spectrom/100+1)), 'p3d_spectrum.png');
imwrite(img_phase, 'p3d_phase.png');

% create filter - vertical notch band reject
filt = ones(size(img_F, 1), size(img_F, 2));
width = 10;
center_margin = 25;
for i=1:size(filt, 1)
   for j=1:size(filt, 2)
       if (j >= size(filt, 2)/2 - width) && (j <= size(filt, 2)/2 + width)
           if (i < size(filt, 1)/2 - center_margin) || (i > size(filt, 1)/2 + center_margin)
               filt(i, j) = 0;
           end
       end
   end
end
figure();
imshow(filt);
title(filt);
imwrite(filt, 'p3d_filter_1.png')

% apply filter by pairwise multiply fourier transform by filter
img_F = img_F .* filt;

% Inverse Fourier zero shift to left top
% and Inverse Fourier Transform
F_img = ifft2(ifftshift(img_F));
F_img = abs(F_img);

% Plot Reconstructed Image
figure()
imshow(F_img)
imwrite(F_img, 'p3d_filtered_image_1.png')
title('reconstruction of image from its Fourier Transform')

% second phase
imtool(F_img)
figure();
imhist(F_img);
title('histogram of image fitered in frequency');
saveas(gcf,'p3d_hist_frequency_filtered_image.png')

% a uniform strip of image
figure();
x = 432;
y = 737;
len = 50;
imshow(F_img(x:x+len, y:y+len));
title('a uniform strip of filtered image in frequency domain');
imwrite(F_img(x:x+len, y:y+len), 'p3d_strip.png');
figure();
histogram(F_img(x:x+len, y:y+len),255);
title('histogram of a uniform strip of image');
saveas(gcf,'p3d_hist_strip_image.png');

% apply filter
filtered_img_2 = imgaussfilt(F_img, 1.2);

% show filtered image
figure();
imshow(filtered_img_2);
imwrite(filtered_img_2, 'p3d_filtered_img_final.png');
title('filtered image final');
figure();
imhist(filtered_img_2);
title('histogram of filtered image');
saveas(gcf,'p3d_hist_filtered_image_final.png')

