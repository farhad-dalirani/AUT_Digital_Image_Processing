function closing_img = gray_closing(img, st)
    % this function calculated closing of an image
    % structuring elemnt
    
    % erosion of image
    dilation_img = gray_dilation(img, st);
    
    % dialarion on erosion
    dilated_eroted_img = gray_erosion(dilation_img, st);
    
    closing_img = dilated_eroted_img;
    
end