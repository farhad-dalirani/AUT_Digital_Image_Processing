%=====================first-image:nature=============================
% read nature image
nature = imread('nature.jpg');

for p_size=3:2:7
    
    %extract palette of image and dominant color
    [palette, dominant] = p7_func(nature, p_size);
    
    % show image
    fig1=figure();
    subplot(p_size+2,p_size, 1:p_size*p_size)
    imshow(nature);

    % display palette
    for c=1:p_size
        color = uint8(ones(100,100,3));
        color(:,:,1) = color(:,:,1)*palette(c,1);
        color(:,:,2) = color(:,:,2)*palette(c,2);
        color(:,:,3) = color(:,:,3)*palette(c,3);
        subplot(p_size+2,p_size,p_size*p_size+c)
        imshow(color)
    end
    %display dominant
    color = uint8(ones(100,100,3));
    color(:,:,1) = color(:,:,1)*dominant(1);
    color(:,:,2) = color(:,:,2)*dominant(2);
    color(:,:,3) = color(:,:,3)*dominant(3);
    subplot(p_size+2,p_size,p_size*p_size+p_size+1:p_size*p_size+p_size+p_size);
    imshow(color)
    
    %save figure
    saveas(fig1, strcat('p7a-1-',num2str(c),'.png'))

end

