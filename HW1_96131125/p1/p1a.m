% Create a 400*400 matrix and fill it with values in range [0, 255]
img = randi([0, 255], 400, 400);

% Convert elements of matrix to unsigned integer 8
img = uint8(img);

% Show image
imshow(img);

% save image
imwrite(img, 'p1a.png');