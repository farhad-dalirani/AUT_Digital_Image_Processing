% read image
img = imread('trump_shout.jpg');

% show image
figure();
imshow(img);

swirl_img = zeros(size(img));
x_prime = zeros(size(img,1), size(img,2));
y_prime = zeros(size(img,1), size(img,2));

x0 =floor(size(img,1)/2.0);
y0 =floor(size(img,2)/2.0);


for u=1:size(img,1)
    for v=1:size(img,2)
        r = sqrt((u-x0)^2 + (v-y0)^2);
        theta = pi*r/512.0;
        x_prime(u,v) = floor((u-x0)*cos(theta)+(v-y0)*sin(theta))+x0;
        y_prime(u,v) = floor(-(u-x0)*sin(theta)+(v-y0)*cos(theta))+y0;
       
    end
end

% cut non-valid data
for u=1:size(img,1)
    for v=1:size(img,2)
        if x_prime(u, v) < 1
            x_prime(u,v) = 1;
        end
        if x_prime(u, v) > size(img, 1)
            x_prime(u,v) = size(img, 1);
        end
        
        if y_prime(u, v) < 1
            y_prime(u,v) = 1;
        end
        if y_prime(u, v) > size(img, 2)
            y_prime(u,v) = size(img, 2);
        end
    end
end

for u=1:size(img,1)
    for v=1:size(img,2)
        swirl_img(u,v,:) = img(x_prime(u,v), y_prime(u,v),:);
    end
end
swirl_img = uint8(swirl_img);

figure();
imshow(swirl_img);
imwrite(swirl_img, 'p5b.png');

