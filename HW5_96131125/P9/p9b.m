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

se1 = [0,1,0;0,1,1;0,0,0;];
se2 = [0,1,0;0,0,1;0,0,0;];

figure();
subplot(2,2,1);
imshow(a);
title('Input')
subplot(2,2,2);
imshow(se1);
title('ST')
subplot(2,2,3);
imshow(imdilate(a, se1));
title('Dilation st with 1 at origin')
subplot(2,2,4);
imshow(imdilate(a, se2));
title('Dilation st with 0 at origin')


figure();
subplot(2,2,1);
imshow(a);
title('Input');
subplot(2,2,2);
imshow(se1);
title('ST')
subplot(2,2,3);
imshow(imerode(a, se1));
title('Erosion st with 1 at origin')
subplot(2,2,4);
imshow(imerode(a, se2));
title('Erosion st with 0 at origin')
