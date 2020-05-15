% read img
img = imread('trump_washington-lr.jpg');
figure();
imshow(img);
title('Input Image');
img = im2double(img);

% doublicate columns
for col=1:size(img,2)
   
    if col == 1
       rescaled_img_col = img(:,col);
       rescaled_img_col = [rescaled_img_col (img(:,col)+img(:,col+1))/2.0];
    else
        if col == size(img,2)
            rescaled_img_col = [rescaled_img_col img(:,col)];
            rescaled_img_col = [rescaled_img_col img(:,col)];
        else
            rescaled_img_col = [rescaled_img_col img(:,col)];
            rescaled_img_col = [rescaled_img_col (img(:,col)+img(:,col+1))/2.0];
        end
       
    end
    
end

% doublicate rows
for row=1:size(rescaled_img_col,1)
   
    if row == 1
       rescaled_img = rescaled_img_col(row, :);
       rescaled_img = [rescaled_img; (rescaled_img_col(row, :)+rescaled_img_col(row+1, :))/2.0];
    else
        if row == size(img,1)
            rescaled_img = [rescaled_img; rescaled_img_col(row, :)];
            rescaled_img = [rescaled_img; rescaled_img_col(row, :)];
        else
            rescaled_img = [rescaled_img; rescaled_img_col(row, :)];
            rescaled_img = [rescaled_img; (rescaled_img_col(row, :)+rescaled_img_col(row+1, :))/2.0];
        end
    end
         
end

figure();
imshow(rescaled_img);
title('Rescaled Image');
imwrite(rescaled_img, 'p4b.png');
