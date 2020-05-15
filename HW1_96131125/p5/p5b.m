% Read input image - original image
iris = imread('irises-reference.jpg');

% Read input image - fake image
iris_temp = imread('irises-tampered.jpg');

% crop two images from same position, it causes same
% pixels in picture have same positions.
iris = iris(3:595, 3:778, :);
iris_temp = iris_temp( 5:597, 1:776,:);


% find differences of two images by using subtracing operator
difference_img = (iris_temp - iris);

% adjust pixels value
difference_img = difference_img.^(3);

%convert image to balck and white
difference_img = im2bw(difference_img);

figure();
imshow(difference_img);
imwrite(difference_img, 'p5b-1.png');

%==============================================
% Read input image - original image
night = imread('the_starry_night-reference.jpg');

% Read input image - fake image
night_fake = imread('the_starry_night-tampered.jpg');

% crop two images from same position, it causes same
% pixels in picture have same positions.
night = night(9:591, 6:740, :);
night_fake = night_fake( 7:589, 8:742,:);

% find differences of two images by using subtracing operator
difference_img = (night_fake - night);

% adjust pixels value
difference_img = difference_img.^(3);

%convert image to balck and white
difference_img = im2bw(difference_img);

figure();
imshow(difference_img);
imwrite(difference_img, 'p5b-2.png');


