% Read Image
img_org = imread('math.png');
figure();
imshow(img_org);
title('Input Image');
img = im2double(img_org);

% read filter
filt = imread('letter_w.png');
filt = im2double(filt);
figure();
imshow(filt);
title('filter');

total_len_x = size(img,1) + size(filt,1);
total_len_y = size(img,2) + size(filt,2);

% Calculate its Fourier Transform and shift origin to center 
img_F = fftshift(fft2(img, total_len_x, total_len_y));

% Calculate Fourier Transform of filter and shift origin to center 
filt_F = fftshift(fft2(filt, total_len_x, total_len_y));    
figure();
imshow(filt_F);
title('Fourier Transform of filter');
imwrite(filt_F, 'p4b_fourier_of_filter.png')

% Spectrom and phase angle
filt_spectrom = abs(filt_F);
imwrite(filt_spectrom, 'p4b_spectrum_of_filter_before_threshold.png')
 
% Phase angle
filt_phase = angle(filt_F);
imwrite(filt_phase, 'p4b_phase_of_filter_before_threshold.png')

% get threshold on spectrum
filt_spectrom = (filt_spectrom > max(abs(filt_spectrom(:)))*0.1).*filt_spectrom; 

% reconstruct fourier transform from spectrum and phase angle
filt_F  = filt_spectrom .* exp(filt_phase*1j);

% Spectrom and phase angle
filt_spectrom = abs(filt_F);
imwrite(filt_spectrom, 'p4b_spectrum_of_filter_after_threshold.png')
 
% Phase angle
filt_phase = angle(filt_F);
imwrite(filt_phase, 'p4b_phase_of_filter_after_threshold.png')

figure();
imshow(filt_F);
title('Fourier Transform of filter-reconstructed');
imwrite(filt_F, 'p4b_fourier_of_filter_after_threshold.png')

% apply filter by pairwise multiply fourier transform by filter
img_F = img_F .* conj(filt_F);

% Inverse Fourier zero shift to left top
% and Inverse Fourier Transform
F_img = ifft2(ifftshift(img_F));
F_img = abs(F_img)/max(F_img(:));

figure()
imshow(F_img)
title('filtered_image_before_threshold.png')
imwrite(F_img, 'p4b_filtered_image.png')


F_img = im2bw(F_img, 0.985);

% highlight highest values
figure()
imshow(F_img)
imwrite(F_img, 'p4b_filtered_image_highest_value.png')
title('Highest value in filtered image')

[x_max, y_max] = find(F_img == 1);
% highlights position of highest value
img_matched_pattern = zeros(size(img,1), size(img,2));
window_len = 9;
window_len_l = 8;
window_len_r = 17;
for i=1:size(x_max,1)
    x_s = max(x_max(i)-window_len, 1);
    x_e = min(x_max(i)+window_len, size(img,1));
    y_s = max(y_max(i)-window_len_l, 1);
    y_e = min(y_max(i)+window_len_r, size(img,2));
    
    img_matched_pattern(x_s:x_e, y_s:y_e) = ...
	    img(x_s:x_e, y_s:y_e); 
end

% location of highest value
figure();
imshow(img_matched_pattern);
imwrite(img_matched_pattern, 'p4b_highest_value.png');
title('Location of highest values after pattern matching');
