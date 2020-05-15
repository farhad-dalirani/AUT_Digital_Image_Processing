% read image
img = imread('donald_kim_meeting.png');

% save as jpeg with different qualities
imwrite(img, 'p1f-q-10.jpeg', 'Quality', 10);
imwrite(img, 'p1f-q-25.jpeg', 'Quality', 25);
imwrite(img, 'p1f-q-50.jpeg', 'Quality', 50);
imwrite(img, 'p1f-q-75.jpeg', 'Quality', 75);
imwrite(img, 'p1f-q-100.jpeg', 'Quality', 100);

img_jpeg = imread('p1f-q-10.jpeg');
disp('PSNR, Quality 10:'); disp(psnr(img_jpeg, img));
img_jpeg = imread('p1f-q-25.jpeg');
disp('PSNR, Quality 25:'); disp(psnr(img_jpeg, img));
img_jpeg = imread('p1f-q-50.jpeg');
disp('PSNR, Quality 50:'); disp(psnr(img_jpeg, img));
img_jpeg = imread('p1f-q-75.jpeg');
disp('PSNR, Quality 75:'); disp(psnr(img_jpeg, img));
img_jpeg = imread('p1f-q-100.jpeg');
disp('PSNR, Quality 100:'); disp(psnr(img_jpeg, img));

