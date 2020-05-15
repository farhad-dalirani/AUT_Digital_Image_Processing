% Read input image - original image
mona = imread('monalisa.png');

% Read input image - fake image
mona_fake = imread('monalisa-fake.png');

%==================== First Manner =======================
% Convert RGB to gray-scale level
mona_gray = rgb2gray(mona);
mona_fake_gray = rgb2gray(mona_fake);

% find differences of two images by using == operator
difference_img = (mona_fake_gray == mona_gray);
figure();
imshow(difference_img);
imwrite(difference_img, 'p5a-1.png');

%==================== Second Manner ======================
% find differences of two images by using subtracing operator
difference_img = (mona_fake - mona);
% adjust pixels value
difference_img = difference_img.^2;
figure();
imshow(difference_img);
imwrite(difference_img, 'p5a-2.png');

