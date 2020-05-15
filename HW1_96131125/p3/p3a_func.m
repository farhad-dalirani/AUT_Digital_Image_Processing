function img_thresholded = p3a_func(img, threshold)
    % get an image and threshold as arguments, then 
    % convert gray scales grater than input threshold to
    % white(255), and others to black(0)
    img_thresholded = uint8(img >= threshold)*255;
end