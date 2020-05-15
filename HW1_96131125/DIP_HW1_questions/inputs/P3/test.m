img = imread('kitten.jpg');

temp = img(60:109, 150:199);

imshow(temp);

res = conv2(img, temp);
res = res / (max(max(res))+0.0);

imshow(res)