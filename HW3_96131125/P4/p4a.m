% Read Image
img_org = imread('math.png');
figure();
imshow(img_org);
title('Input Image');
%img = rgb2gray(img_org);
img = im2double(img_org);

% read filter
filt = imread('letter_w.png');
filt = im2double(filt);
figure();
imshow(filt);
title('filter');

total_len_x = size(img,1) + size(filt,1);
total_len_y = size(img,2) + size(filt,2);
%totoal_len_x = size(img,1);
%totoal_len_y = size(img,2);

% Calculate its Fourier Transform and shift origin to center 
img_F = fftshift(fft2(img, total_len_x, total_len_y));
%img_F = fftshift(fft2(img,totoal_len_x,totoal_len_y));
%img_F = fft2(img,totoal_len_x,totoal_len_y);

% Calculate Fourier Transform of filter and shift origin to center 
filt_F = fftshift(fft2(filt, total_len_x, total_len_y));    
%filt_F = fft2(filt, totoal_len_x, totoal_len_y);  

% apply filter by pairwise multiply fourier transform by filter
%img_F = img_F .* filt_F;
img_F = img_F .* conj(filt_F);

% Inverse Fourier zero shift to left top
% and Inverse Fourier Transform
F_img = ifft2(ifftshift(img_F));
F_img = abs(F_img)/max(F_img(:));

% get threshold
figure()
imshow(F_img)
imwrite(F_img, 'p4a_filtered_image_before_threshold.png')
F_img = im2bw(F_img, 0.985); 

% Plot Reconstructed Image
figure()
imshow(F_img)
imwrite(F_img, 'p4a_filtered_image_thresholded.png')
title('reconstruction of image from its Fourier Transform and thresholding')

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
figure()
imshow(img_matched_pattern)
imwrite(img_matched_pattern, 'p4a_highest_value.png')
title('Location of highest values after pattern matching')
