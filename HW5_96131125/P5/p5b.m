% read image
img = imread('russia_2018.png');
img = im2bw(img, 0.5);

figure();
imshow(img);
title('Input Image');

%=====================first manner=======================
% a point inside each hole
fill_points = [98, 513;
               207, 448;
               251, 479;
               248, 437;
               278, 449;
               109, 645;
               142, 655;
               144, 702;
               262, 796;
               353, 690;
               375, 657;
               381, 705;
               405, 664;
               703, 580;
               789, 694;
               818, 703;
               858, 714;
               905, 712;
               878, 639;
               902, 629;
               925, 614;
               427, 504;
               461, 490;
               940, 581];
           
% negate image
img = 1 - img;

% structuring element
st = strel('arbitrary', [1 1 1; 1 1 1; 1 1 1]);

% fill fidifferent holes
for i=1:size(fill_points,1)
    x = fill_points(i,1);
    y = fill_points(i,2);
    
    % fill inside hole
    previous_dilate = zeros(size(img,1), size(img,2));
    previous_dilate(x, y) = 1;
    current_dilate = imdilate(previous_dilate, st) & (1-img);
    
    while sum(sum(previous_dilate ~= current_dilate)) > 0
        previous_dilate = current_dilate;
        current_dilate = imdilate(previous_dilate, st) & (1-img);
    end
    
    img = img | current_dilate;
end

% negate image
img = 1 - img;

figure();
imshow(img);
title('Output Image');
imwrite(img, 'p5b-manner-1.png')




%=====================second manner=======================
% read image
img = imread('russia_2018.png');
img = im2bw(img, 0.5);

% structuring element
st = strel('arbitrary', ones(65,65));
img_open = imopen(img, st);


figure();
imshow(img_open);
title('Output Image');
imwrite(img_open, 'p5b-manner-2.png')