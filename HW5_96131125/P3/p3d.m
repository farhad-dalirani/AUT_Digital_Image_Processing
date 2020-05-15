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

% call closing
closed_img = binary_closing(img, st);


figure();
imshow(closed_img);
title('closed Image');
imwrite(closed_img, 'p3d.png');
