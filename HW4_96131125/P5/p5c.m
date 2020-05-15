% read image
img = imread('harry_meghan.jpg');
img = im2double(img);
img_in = img;
img_out = img_in;

% show image
figure();
imshow(img);
title('input');

ranges = [[22,100,122,638];[371,433,162,635];[443,503,116,678]];
thresholds = [0.79, 0.79, 0.79];

% different channel of RGB
for channel = 1:3
    
    img = img_in(:,:,channel);
    img_copy = img;
    % different rectangulars that contain fold
    for range_i = 1:3

        threshold = thresholds(range_i);
        range = ranges(range_i,:);
        
        % investigate every picel inside rectangular 
        % to check a pixel is part of fold or not
        for i = range(1):range(2)
            for j = range(3):range(4)
                if (img(i,j)<=threshold+0.02 && img(i,j)>=threshold-0.03) || (img(i,j)>=0 && img(i,j)<=0.10)
                    % find four neighbour of pixel 
                    % that are not inside fold
                    p=j-1;
                    while((img(i,p)<=threshold+0.02 && img(i,p)>=threshold-0.03) || ...
                        ((img(i,p)>=0 && img(i,p)<=0.10) || (img(i,p+1)>=0 && img(i,p+1)<=0.10) || (img(i,p-1)>=0 && img(i,p-1)<=0.10)))
                        p = p-1;
                        if p == 2
                            break;
                        end
                    end
                    q=j+1;
                    while((img(i,q)<=threshold+0.02 && img(i,q)>=threshold-0.03) ||...
                        ((img(i,q)>=0 && img(i,q)<=0.10) || (img(i,q-1)>=0 && img(i,q-1)<=0.10) || (img(i,q+1)>=0 && img(i,q+1)<=0.10)))
                        q = q+1;
                        if q+1 == size(img,2)
                            break;
                        end
                    end

                    k=i-1;
                    while((img(k,j)<=threshold+0.02 && img(k,j)>=threshold-0.03)  || ...
                            ((img(k,j)>=0 && img(k,j)<=0.10) || (img(k+1,j)>=0 && img(k+1,j)<=0.10) || (img(k-1,j)>=0 && img(k-1,j)<=0.10)))
                        k = k-1;
                        if k == 2
                            break;
                        end
                    end
                    n=i+1;
                    while((img(n,j)<=threshold+0.02 && img(n,j)>=threshold-0.03) || ...
                            ((img(n,j)>=0 && img(n,j)<=0.10) || (img(n-1,j)>=0 && img(n-1,j)<=0.10) || (img(n+1,j)>=0 && img(n+1,j)<=0.10)))
                        n = n+1;
                        if n+1 == size(img,1)
                            break;
                        end
                    end

                    img_copy(i,j) = (img(i,p)+img(i,q)+img(k,j)+img(n,j))/4; 
                end
            end
        end

    end
    img_out(:,:,channel) = img_copy;
end

% show image
figure();
imshow(img_out);
title('output');
imwrite(img_out, 'p5c.png');