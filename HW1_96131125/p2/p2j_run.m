T1 = imread('trump.jpg');
T2 = rgb2gray(T1);

% rotate T2 by 90
img_rot90 = p2j_func(T2, 90);
figure();
imshow(img_rot90);
title('Rotate Trump Gray Scale by 90');
imwrite(img_rot90, 'p2j-1.png');

% rotate T2 by 180
img_rot180 = p2j_func(T2, 180);
figure();
imshow(img_rot180);
title('Rotate Trump Gray Scale by 180');
imwrite(img_rot180, 'p2j-2.png');

% rotate T2 by 270
img_rot270 = p2j_func(T2, 270);
figure();
imshow(img_rot270);
title('Rotate Trump Gray Scale by 270');
imwrite(img_rot270, 'p2j-3.png');

isequal(img_rot90, imrotate(T2, 90))
isequal(img_rot180, imrotate(T2, 180))
isequal(img_rot270, imrotate(T2, 270))