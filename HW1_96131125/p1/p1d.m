% Create a 400*400 matrix which at beginnig all elements
% have value 255
img1 = ones(400, 400)*255;

% Create a cross at the center of image with width 100
img1(:, 151:250) = zeros(400, 100);
img1(151:250, :) = zeros(100, 400);

% Convert elements of matrix to unsigned integer 8
img1 = uint8(img1);

% Show image
imshow(img1);

% save image
imwrite(img1, 'p1d.png');



