% read images
img_1 = imread('rouhani_signature.jpg');
img_1 = im2bw(img_1);
img_2 = imread('trump_signature.jpg');
img_2 = im2bw(img_2);

figure();
subplot(2,1,1);
imshow(img_1);
title('Rouhani input signatue');
subplot(2,1,2);
imshow(img_2);
title('Trump input signatue');

% skeleton --> end point
img_1_sk = bwmorph(1-img_1,'skel',Inf);
img_2_sk = bwmorph(1-img_2,'skel',Inf);
img_1_ep = bwmorph(img_1_sk,'Endpoints');
img_2_ep = bwmorph(img_2_sk,'Endpoints');

figure();
subplot(2,1,1);
imshow(img_1_ep);
imwrite(img_1_ep, 'p6b-rouhani_signature.png');
title('Rouhani signatue-end point');
subplot(2,1,2);
imshow(img_2_ep);
imwrite(img_2_ep, 'p6b-trump_signature.png');
title('Trump signatue-end point');
