% beach

% raed beach img
img_beach = imread('beach.jpg');
img_beach = rgb2gray(img_beach);

% display image
figure();
imshow(img_beach);
title('input image-beach');

% apply adaptive non-overlapping block histogram equalization
adap_hist_eq_beach_non_overlapping = non_overlapping_block_hist_eq(img_beach, 200);

% apply adaptive overlapping block histogram equalization
adap_hist_eq_beach_overlapping = overlapping_hist_eq(img_beach, 71);

% display image
figure();
imshow(adap_hist_eq_beach_non_overlapping);
title('output image-adaprive non-overlapping histeq-beach');
imwrite(adap_hist_eq_beach_non_overlapping,'p6b-beach-1.png')

% display image
figure();
imshow(adap_hist_eq_beach_overlapping);
title('output image-adaprive histeq-beach overlapping blocks');
imwrite(adap_hist_eq_beach_overlapping,'p6b-beach-2.png')


% car

% raed car img
img_car = imread('DgGeap_WsAAUO3V.jpg');
img_car = rgb2gray(img_car);

% display image
figure();
imshow(img_car);
title('input image-car');

% apply adaptive non-overlapping block histogram equalization
adap_hist_eq_car_non_overlapping = non_overlapping_block_hist_eq(img_car, 200);

% apply adaptive overlapping block histogram equalization
adap_hist_eq_car_overlapping = overlapping_hist_eq(img_car, 71);

% display image
figure();
imshow(adap_hist_eq_car_non_overlapping);
title('output image-adaprive non-overlapping histeq-car');
imwrite(adap_hist_eq_car_non_overlapping,'p6b-car-1.png')

% display image
figure();
imshow(adap_hist_eq_car_overlapping);
title('output image-adaprive histeq-car overlapping blocks');
imwrite(adap_hist_eq_car_overlapping,'p6b-car-2.png')

