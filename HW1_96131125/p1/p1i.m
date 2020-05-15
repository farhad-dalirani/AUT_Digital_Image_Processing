p1b = imread('p1b.png');
p1c = imread('p1c.png');
p1d = imread('p1d.png');
p1e = imread('p1e.png');
p1f = imread('p1f.png');
p1g = imread('p1g.png');

%Obtain c by transposing matrix b
p1c_b = transpose(p1b);

figure()
subplot(1,2,1)
imshow(p1b)
subplot(1,2,2)
imshow(p1c_b)
title('obtain c by transposing b')

%Obtain d by doing 'and' between a, b
p1d_bc = (p1b & p1c).*255;

figure()
subplot(1,3,1)
imshow(p1b)
subplot(1,3,2)
imshow(p1c)
subplot(1,3,3)
imshow(p1d_bc)
title('obtain d by b | c')

%Obtain e by doing 'or' between a, b
p1d_bc = (p1b | p1c).*255;

figure()
subplot(1,3,1)
imshow(p1b)
subplot(1,3,2)
imshow(p1c)
subplot(1,3,3)
imshow(p1d_bc)
title('obtain e by b & c')
