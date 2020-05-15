% Read input image, Input is a RGB image
img = imread('trump-pence.jpg');

% Use imtool for displaying image and finding Trump's face
imtool(img);

% Call censor-smoothing fucntion 
censored_img = p2a_func(img, [92, 310], [244, 420], 9);
figure();
imshow(censored_img);
title('9 * 9 Kernel Size');
imwrite(censored_img, 'trump_9_in_9.png')

% Call censor-smoothing fucntion 
censored_img = p2a_func(img, [92, 310], [244, 420], 15);
figure();
imshow(censored_img);
title('15 * 15 Kernel Size');
imwrite(censored_img, 'trump_15_in_15.png')

% Call censor-smoothing fucntion 
censored_img = p2a_func(img, [92, 310], [244, 420], 25);
figure();
imshow(censored_img);
title('25 * 25 Kernel Size');
imwrite(censored_img, 'trump_25_in_25.png')

% Call censor-smoothing fucntion 
censored_img = p2a_func(img, [92, 310], [244, 420], 51);
figure();
imshow(censored_img);
title('51 * 51 Kernel Size');
imwrite(censored_img, 'trump_51_in_51.png')