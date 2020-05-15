% read input image 
img = imread('surprise.jpg');
figure();
imshow(img);
title('Input image');

% histogram of image
figure();
imhist(img);
title('histogram of input image');
saveas(gcf,'p7d-input-hist.png');

% applying gama transformation for making image washed-out
gamma = 0.2;
c = 255/(double(max(max(img)))^gamma);
img_gamma = uint8(c * (double(img).^gamma));
imwrite(img_gamma,'p7d-washed-out.png');

% display image
figure();
imshow(img_gamma);
title('Input image');

% histogram of image
figure();
imhist(img_gamma);
title('histogram of input image');
saveas(gcf,'p7d-output-hist.png');
