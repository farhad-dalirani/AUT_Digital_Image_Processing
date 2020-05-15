% Create a 400*400 matrix which at beginnig all elements
% have value 255
img = ones(400, 400)*255;

% Create a horizontal line at the center of image with width 100
img(151:250, 151:250) = zeros(100, 100);

% Convert elements of matrix to unsigned integer 8
img = uint8(img);

% Show image
imshow(img);

% save image
imwrite(img, 'p1e.png');