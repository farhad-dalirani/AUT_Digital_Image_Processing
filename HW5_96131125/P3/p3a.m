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

% call dialation
dialated_img = binary_dilation(img, st);


figure();
imshow(dialated_img);
title('Dialated Image');
imwrite(dialated_img, 'p3a.png');
