a = [
    0, 0, 0, 0, 0, 0, 0 , 0 , 0, 0, 0, 0, 0, 0, 0, 0;
    0, 0, 0, 0, 0, 0, 0 , 0 , 0, 0, 0, 1, 0, 0, 0, 0;
    0, 0, 0, 0, 0, 1, 0 , 0 , 0, 0, 1, 1, 0, 0, 0, 0;
    0, 0, 1, 0, 0, 1, 1 , 0 , 0, 1, 1, 1, 1, 0, 0, 0;
    0, 0, 1, 0, 0, 1, 1 , 1 , 1, 1, 0, 1, 1, 0, 0, 0;
    0, 0, 1, 1, 1, 1, 1 , 1 , 1, 1, 0, 1, 0, 0, 0, 0;
    0, 0, 0, 0, 0, 1, 0 , 0 , 0, 0, 0, 0, 0, 0, 1, 0;
    0, 0, 0, 0, 0, 0, 0 , 0 , 0, 0, 0, 0, 0, 0, 0, 0;
    ];
a = im2bw(a, 0.5);

se1 = [0,0,1];
figure();
subplot(2,2,1);
imshow(a);
title('Input')
subplot(2,2,2);
imshow(se1);
title('ST')
subplot(2,2,3);
imshow(imdilate(a, se1));
title('Dilation st')

