%=====================first-image:nature=============================
% read nature image
nature = imread('nature.jpg');


for p_size=3:2:7
    
    % ssegment image by palette
    segment_nature = p7_func_c(nature, p_size);
    
    %show new image
    fig1=figure();
    imshow(segment_nature);
    title(strcat('palette size = ', num2str(p_size)));
    
    %save figure
    saveas(fig1, strcat('p7c-1-',num2str(p_size),'.png'))

end

%=====================second-image:noucamp=============================
% read nature image
noucamp = imread('noucamp.jpg');


for p_size=5:2:9
    
    % ssegment image by palette
    segment_noucamp = p7_func_c(noucamp, p_size);
    
    %show new image
    fig1=figure();
    imshow(segment_noucamp);
    title(strcat('palette size = ', num2str(p_size)));
    
    %save figure
    saveas(fig1, strcat('p7c-2-',num2str(p_size),'.png'))

end