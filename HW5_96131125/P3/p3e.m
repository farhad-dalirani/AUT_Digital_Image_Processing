% read image
img = imread('barcode_grayscale.jpg');
img = im2double(img);

figure();
imshow(img);
title('Input Image');

% structuring element
st =   [0 0 1 0 0;
        0 1 1 1 0;
        1 1 1 1 1;
        0 1 1 1 0;
        0 0 1 0 0;];
st = st .* 0.01;

% call dialation
dialated_img = gray_dilation(img, st);

figure();
imshow(dialated_img);
title('Dialated Image');
imwrite(dialated_img, 'p3e.png');

dialated_img_scale = imadjust(dialated_img,[min(min(dialated_img)) max(max(dialated_img))],[0 1]);
figure();
imshow(dialated_img_scale);
title('Dialated Image adjust');
imwrite(dialated_img_scale, 'p3e-adjust.png');