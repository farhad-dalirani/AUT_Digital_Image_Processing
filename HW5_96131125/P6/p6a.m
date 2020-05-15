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

% skeleton
img_1_sk = bwmorph(1-img_1,'skel',Inf);
img_2_sk = bwmorph(1-img_2,'skel',Inf);

figure();
subplot(2,1,1);
imshow(img_1_sk);
imwrite(img_1_sk, 'p6a-rouhani_signature.png');
title('Rouhani signatue-skeleton');
subplot(2,1,2);
imshow(img_2_sk);
imwrite(img_2_sk, 'p6a-trump_signature.png');
title('Trump signatue-skeleton');
