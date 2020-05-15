% read noise free image 
img_target = imread('tiny_trump.jpg');

% read first noisy image
img_noisy = imread('tiny_trump-1.jpg');

% display image
figure();
imshow(img_target);
title('noisy free picture');

% display first noisy image
figure();
imshow(img_noisy);
title('noisy picture 1');

% apply gaussian filter with appropriate standard deviation
gaussfilt_img = imgaussfilt(img_noisy, 1.1);
imwrite(gaussfilt_img, 'p9c-gaussfilterd-image.png');

% display first noisy image
figure();
imshow(gaussfilt_img);
title('noisy picture 1 after applying gauss filter');

% calculate SNR for noisy image before and after filter
snr_before = p9_snr(img_noisy, img_target);
snr_after = p9_snr(gaussfilt_img, img_target);

fprintf('SNR of noisy image before applying filter: %d\n', snr_before);
fprintf('SNR of noisy image after  applying filter: %d\n', snr_after);
