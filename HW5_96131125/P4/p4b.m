% read refrence image
img_org = imread('viva_team_melli.png');
img_org = im2bw(img_org, 0.5);

% read modified image
img_morf = imread('viva_team_melli_b.png');
img_morf = im2bw(img_morf, 0.5);

% show images
%figure();
%subplot(1,2,1);
%imshow(img_org);
%title('Refrence Image');
%subplot(1,2,2);
%imshow(img_morf);
%title('Modified Image');

bin_matrix = [1 1 1;
              0 0 0
              1 1 1];
        
% opening
se = strel('arbitrary', bin_matrix); 
img_open = imopen(img_org, se);

% show result
% show images
figure();
set(gcf,'color','b');
subplot(2,2,1);
imshow(img_org);
title('Reference Image');
subplot(2,2,2);
imshow(img_morf);
title('Given Modified Image');
subplot(2,2,3);
imshow(img_open);
title('Image after applying proper SE');
subplot(2,2,4);
imshow(bin_matrix);
title('proper SE');

saveas(gcf,'p4b.png')
