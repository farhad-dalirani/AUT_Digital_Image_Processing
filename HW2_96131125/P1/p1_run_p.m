% read image
img = imread('modern_mario.jpg');

% display image
figure();
imshow(img);
title('Orginal')

% call pixelate function
pixelated_img = p1a_func_p(img, [10,10,3]);
% display pixelated image
figure();
imshow(pixelated_img);
title('10 * 10');
imwrite(pixelated_img, 'p1-a-p.png');

% call pixelate function
pixelated_img = p1a_func_p(img, [25,25,3]);
% display pixelated image
figure();
imshow(pixelated_img);
title('25 * 25');
imwrite(pixelated_img, 'p1-b-p.png');

% call pixelate function
pixelated_img = p1a_func_p(img, [50,50,3]);
% display pixelated image
figure();
imshow(pixelated_img);
title('50 * 50');
imwrite(pixelated_img, 'p1-c-p.png');

% call pixelate function
pixelated_img = p1a_func_p(img, [120,120,3]);
% display pixelated image
figure();
imshow(pixelated_img);
title('120 * 120');
imwrite(pixelated_img, 'p1-d-p.png');

% call pixelate function
pixelated_img = p1a_func_p(img, [300,300,3]);
% display pixelated image
figure();
imshow(pixelated_img);
title('300 * 300');
imwrite(pixelated_img, 'p1-e-p.png');



