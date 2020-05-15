% read image
img = imread('leo.jpg');
img = im2bw(img, 0.02);

figure();
imshow(img);
title('Input Image');

% ===============first manner==========================
se = strel('arbitrary', [1,1]);
img_opening = imopen(img, se);
se = strel('arbitrary', [1;1]);
img_opening = imopen(img_opening, se);

figure();
imshow(img_opening);
title('Modified Image');
imwrite(img_opening, 'p5c-manner-1.png')

% ===============second manner==========================
regions = [1,1; 305,292; 521, 271;652, 351; 1 947; 251, 1280; 251, 1003; 716,1280];

for i=1:8
    if mod(i,2) == 0
        continue;
    end
    
    se = strel('arbitrary', [0,1,0;1,1,1;0,1,0]);
    img(regions(i,1):regions(i+1,1), regions(i,2):regions(i+1,2)) = ...
            imopen(img(regions(i,1):regions(i+1,1), regions(i,2):regions(i+1,2)), se);
    
end
figure();
imshow(img);
title('Modified Image');
imwrite(img, 'p5c-manner-2.png')
