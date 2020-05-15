% read image
img = imread('serious_cat.jpg');

imtool(img);

% show image and its histogram
figure();
imshow(img);
title('Input image');
figure();
imhist(img);
saveas(gcf, 'p8c-input-hist.png');

a = 2;
b = 45;
M=255;
% window intensity
for i=1:size(img,1)
    for j=1:size(img,2)
        if img(i,j) < a
           img(i,j)=uint8(0); 
        else
            if img(i,j) <= b
                img(i,j) = uint8(M * (double(img(i,j))-a)/(b-a));
            else
                img(i,j) = uint8(M);
            end
        end
    end
end

figure();
imshow(img);
title('p8c-result of intensity windowing');
imwrite(img, 'p8c-result of intensity windowing.png');
figure();
imhist(img);
saveas(gcf, 'p8c-hist-result-intensity-windowing.png');

