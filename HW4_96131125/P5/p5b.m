% read image
img = imread('queen_elizabeth_wedding.jpg');
img = im2double(img);
img_in = img;
img_out = img_in;

% show image
figure();
imshow(img);
title('input');

ranges = [[256,772,24,75];[10,256,24,75];[482,508,23,374];[482,508,382,569];[33,51,23,361]];
thresholds = [0.86, 0.2, 0.89,0.2, 0.3];

% different channel of RGB
for channel = 1:3
    
    img = img_in(:,:,channel);

    % different rectangulars that contain fold
    for range_i = 1:5

        threshold = thresholds(range_i);
        range = ranges(range_i,:);
        
        % investigate every picel inside rectangular 
        % to check a pixel is part of fold or not
        for i = range(1):range(2)
            for j = range(3):range(4)
                if img(i,j)>=threshold
                    % find four neighbour of pixel 
                    % that are not inside fold
                    p=j-1;
                    while(img(i,p)>=threshold)
                        p = p-1;
                        if p == 1
                            break;
                        end
                    end
                    q=j+1;
                    while(img(i,q)>=threshold)
                        q = q+1;
                        if q == size(img,2)
                            break;
                        end
                    end

                    k=i-1;
                    while(img(k,j)>=threshold)
                        k = k-1;
                        if k == 1
                            break;
                        end
                    end
                    n=i+1;
                    while(img(n,j)>=threshold)
                        n = n+1;
                        if n == size(img,1)
                            break;
                        end
                    end

                    img(i,j) = (img(i,p)+img(i,q)+img(k,j)+img(n,j))/4; 
                end
            end
        end

    end
    img_out(:,:,channel) = img;
end

% show image
figure();
imshow(img_out);
title('output');
imwrite(img_out, 'p5b.png');