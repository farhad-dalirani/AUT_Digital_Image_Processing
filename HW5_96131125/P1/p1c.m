clear;clc;

% read image
img = imread('ali.png');

figure();
imshow(img);
title('Input Image');

M = size(img,1);
N = size(img,2);

% direction of moving
dx = -1;
dy = 1;

order_value = [];
order_index = [];

% current position
x_cur = 1;
y_cur = 1;

% zic zag order
for i = 1:M*N
    order_value = [order_value img(x_cur, y_cur)];
    order_index = [order_index; [x_cur, y_cur]];
    
    % go to next pixel
    x_cur = x_cur + dx;
    y_cur = y_cur + dy;
    
    % if reach edge of image change direction
    if x_cur == 0 && y_cur == N+1
        x_cur = 2;
        y_cur = N;
        dx = -dx;
        dy = -dy;
        continue;
    end
    
    if y_cur == 0 && x_cur == M+1
        y_cur = 2;
        x_cur = M;
        dx = -dx;
        dy = -dy;
        continue;
    end
    
    if x_cur == 0
        x_cur = 1;
        
        dx = -dx;
        dy = -dy;
        continue;
    end
    
    if y_cur == 0
        y_cur = 1;
        
        dx = -dx;
        dy = -dy;
        continue;
    end
    
    if x_cur == M+1
        x_cur = M;
        y_cur = y_cur + 2;
        dx = -dx;
        dy = -dy;
        continue;
    end
    
    if y_cur == N+1
        y_cur = N;
        x_cur = x_cur + 2;
        dx = -dx;
        dy = -dy;
        continue;
    end
    
end

disp('Zic Zac Order of Image(values): ');
disp(order_value);

disp('Zic Zac Order of Image(Index): ');
disp(order_index);

new_img = order_value;
figure();
imshow(new_img);
title('output Image');
imwrite(new_img, 'p1c.png');