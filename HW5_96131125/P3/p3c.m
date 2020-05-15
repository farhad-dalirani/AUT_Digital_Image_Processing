% read image
img = imread('barcode_binary.jpg');
img = im2bw(img);

figure();
imshow(img);
title('Input Image');

% structuring element
st =   [0 0 0 1 0 0 0;
        0 0 1 1 1 0 0;
        0 1 1 1 1 1 0;
        1 1 1 1 1 1 1;
        0 1 1 1 1 1 0;
        0 0 1 1 1 0 0;
        0 0 0 1 0 0 0];

% call opening
opened_img = binary_opening(img, st);


figure();
imshow(opened_img);
title('opening Image');
imwrite(opened_img, 'p3c.png');
