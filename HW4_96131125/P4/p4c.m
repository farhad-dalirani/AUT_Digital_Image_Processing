% read img
img = imread('trump_washington-lr.jpg');
figure();
imshow(img);
title('Input Image');
img = im2double(img);

% first do linear interpolation

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
for row=1:size(img,1)
   
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

rescaled_img_2 = rescaled_img;
% second do nearest neighbourhood
for i=1:size(rescaled_img,1)
    for j=1:size(rescaled_img,2)
        
        if mod(i,2) == 0
            if mod(j,2) == 0
                neighbors_value_diff = [];
                neighbors_value = [];
                if i-1>=1
                    neighbors_value_diff = [neighbors_value_diff abs(rescaled_img(i-1,j)-rescaled_img(i,j))];
                    neighbors_value = [neighbors_value rescaled_img(i-1,j)];
                end
                if i+1<=size(img,1)
                    neighbors_value_diff = [neighbors_value_diff abs(rescaled_img(i+1,j)-rescaled_img(i,j))];
                    neighbors_value = [neighbors_value rescaled_img(i+1,j)];
                end
                if j-1>=1
                    neighbors_value_diff = [neighbors_value_diff abs(rescaled_img(i,j-1)-rescaled_img(i,j))];
                    neighbors_value = [neighbors_value rescaled_img(i,j-1)];
                end
                if j+1<=size(img,2)
                    neighbors_value_diff = [neighbors_value_diff abs(rescaled_img(i,j+1)-rescaled_img(i,j))];
                    neighbors_value = [neighbors_value rescaled_img(i,j+1)];
                end
                [min_diff, index] = min(neighbors_value_diff);
                rescaled_img_2(i,j) = neighbors_value(index);
            end
        else
            neighbors_value_diff = [];
                neighbors_value = [];
                if i-1>=1
                    neighbors_value_diff = [neighbors_value_diff abs(rescaled_img(i-1,j)-rescaled_img(i,j))];
                    neighbors_value = [neighbors_value rescaled_img(i-1,j)];
                end
                if i+1<=size(img,1)
                    neighbors_value_diff = [neighbors_value_diff abs(rescaled_img(i+1,j)-rescaled_img(i,j))];
                    neighbors_value = [neighbors_value rescaled_img(i+1,j)];
                end
                if j-1>=1
                    neighbors_value_diff = [neighbors_value_diff abs(rescaled_img(i,j-1)-rescaled_img(i,j))];
                    neighbors_value = [neighbors_value rescaled_img(i,j-1)];
                end
                if j+1<=size(img,2)
                    neighbors_value_diff = [neighbors_value_diff abs(rescaled_img(i,j+1)-rescaled_img(i,j))];
                    neighbors_value = [neighbors_value rescaled_img(i,j+1)];
                end
                [min_diff, index] = min(neighbors_value_diff);
                rescaled_img_2(i,j) = neighbors_value(index);
        end
    end
end

figure();
imshow(rescaled_img_2);
title('Rescaled Image');
imwrite(rescaled_img_2, 'p4c.png');