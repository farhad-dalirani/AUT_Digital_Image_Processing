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

% call erosion
erosion_img = binary_erosion(img, st);


figure();
imshow(erosion_img);
title('Eroted Image');
imwrite(erosion_img, 'p3b.png');
