function out=p3d_func(img)
    
    % allocate an array for storing the number of occurrence of 
    %each gray scale level
    gray_scale_repetition = zeros(256,1);
    
    for i=1:size(img,1)
        for j=1:size(img,2)
            gray_scale_repetition(img(i,j)+1,1) = gray_scale_repetition(img(i,j)+1,1)+1;
        end
    end
    
    bar(gray_scale_repetition)
end