% Read input image, Input is a RGB image
img = imread('larry.jpg');

% Use imtool for displaying image and finding Larry's face
imtool(img);

% Call censor-pixelate fucntion (region 200*180)
censored_img = p2b_func(img, [125, 270], [325, 470], [5, 5]);
figure();
imshow(censored_img);
title('Resolution 5 * 5');
imwrite(censored_img, 'Larry_5_in_5.png')

% Call censor-pixelate fucntion (region 200*180)
censored_img = p2b_func(img, [125, 270], [325, 470], [10, 10]);
figure();
imshow(censored_img);
title('Resolution 10 * 10');
imwrite(censored_img, 'Larry_10_in_10.png')

% Call censor-pixelate fucntion (region 200*180)
censored_img = p2b_func(img, [125, 270], [325, 470], [20, 20]);
figure();
imshow(censored_img);
title('Resolution 20 * 20');
imwrite(censored_img, 'Larry_20_in_20.png')

% Call censor-pixelate fucntion (region 200*180)
censored_img = p2b_func(img, [125, 270], [325, 470], [30, 30]);
figure();
imshow(censored_img);
title('Resolution 30 * 30');
imwrite(censored_img, 'Larry_30_in_30.png')

% Call censor-pixelate fucntion (region 200*180)
censored_img = p2b_func(img, [125, 270], [325, 470], [50, 50]);
figure();
imshow(censored_img);
title('Resolution 50 * 50');
imwrite(censored_img, 'Larry_50_in_50.png')
