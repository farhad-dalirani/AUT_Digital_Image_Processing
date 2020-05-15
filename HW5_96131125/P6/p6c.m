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


figure();
subplot(2,1,1);
img1_neg = 1-img_1;
[i,j] = ind2sub(size(img1_neg), find(bwmorph(bwmorph(img1_neg,'thin',Inf),'branchpoint') == 1));
imshow(img1_neg); hold on; plot(j,i,'rx');
title('Rouhani signatue-Junction point');
subplot(2,1,2);
img2_neg = 1-img_2;
[i,j] = ind2sub(size(img2_neg), find(bwmorph(bwmorph(img2_neg,'thin',Inf),'branchpoint') == 1));
imshow(img2_neg); hold on; plot(j,i,'rx');
title('Trump signatue-Junction point');
