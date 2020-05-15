function closed_img = binary_closing(img, st)
    % this function calculated closing of an image
    % structuring elemnt
    
    % erosion of image
    dilated_img = binary_dilation(img, st);
    
    % dialarion on erosion
    eroted_dilated_img = binary_erosion(dilated_img, st);
    
    closed_img = eroted_dilated_img;
    
end