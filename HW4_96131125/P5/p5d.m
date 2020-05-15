% read image
img_d = imread('donald.png');
img_m = imread('mahmoud.png');

% show image
figure();
imshow(img_d);
title('input');

% show image
figure();
imshow(img_m);
title('input');

img = img_d;
% randomly select some pixels and swap pixels
for i=1:100

    % 100000, radom index
    x = randi(size(img,1), 1,12000);
    y = randi(size(img,2), 1,12000);
    
    % replace pixels from mahmod to current picture
    for j = 1:12000
        img(x(j), y(j),:) = img_m(x(j), y(j),:);
    end
    if mod(i,10)==0
        figure();
        imshow(img);
        title(num2str(i));
        imwrite(img, strcat('step-',num2str(i),'.png'))
    end
end

% show image
figure();
imshow(img_d);
title('input');
