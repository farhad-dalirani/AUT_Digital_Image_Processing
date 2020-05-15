% read image
img = imread('barcode_grayscale.jpg');
img = im2double(img);

figure();
imshow(img);
title('Input Image');

% structuring element
st =   ones(19,5);
st = st .* 0.01;

% call opening
opening_img = gray_opening(img, st);

figure();
imshow(opening_img);
title('Opening - Image');
imwrite(opening_img, 'p3g.png');

opening_img_scale = imadjust(opening_img,[min(min(opening_img)) max(max(opening_img))],[0 1]);
figure();
imshow(opening_img_scale);
title('Opening - Image adjust');
imwrite(opening_img_scale, 'p3g-adjust.png');