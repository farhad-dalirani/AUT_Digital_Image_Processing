% Create a 400*400 matrix which at beginnig all elements
% have value 255
img2 = ones(400, 400)*255;

% Create a diagonal cross at the center of image with width 100
for x = 1:400
    for y= 1:400
        
        % if distance of pixel to line x=-y+400 is less than
        % 50, then set value of pixel to zero (black)
        if abs(1*x+1*y-400)/sqrt(1*1+1*1) <= 50
            img2(x, y) = 0;
        end
        
        % if distance of pixel to line x=+y+0 is less than
        % 50, then set value of pixel to zero (black)
        if abs(+1*x-1*y+0)/sqrt(+1*+1+(-1)*(-1)) <= 50
            img2(x, y) = 0;
        end
        
    end
end

% Convert elements of matrix to unsigned integer 8
img2 = uint8(img2);

% Show image
figure();
imshow(img2);

% save image
imwrite(img2, 'p1f.png');