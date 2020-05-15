function histeq_img = histeq_mine(img)
    % This function gets an image then it applies 
    % histogram equalization on it.
    
    % an array for holding the number of repetition of each intensity.
    count_intensities = double(zeros(1, 256));
    
    % count repetition of each intensity
    for i=1:size(img,1)
        for j=1:size(img,2)
            count_intensities(1,img(i,j)+1)= count_intensities(1,img(i,j)+1)+1;
        end
    end
    
    % calculate probability of occurrence of each intensity
    prob_intensities = count_intensities / (size(img,1)*size(img,2));
    
    cumulative_prob_inten = prob_intensities;
    % calculate cumulative sum of intensities probability
    for i=2:size(cumulative_prob_inten,2)
        cumulative_prob_inten(1,i) = cumulative_prob_inten(1,i)+cumulative_prob_inten(1,i-1);
    end
    
    % calculate new intensity replacment of each intensity by
    % multiplying cumulative sum of intensities probabilities by  255
    new_intensities = cumulative_prob_inten * 255;
    
    % round 
    new_intensities = uint8(round(new_intensities));
    
    % replace previous intensities with new ones
    histeq_img = img;
    for i=1:size(img,1)
        for j=1:size(img,2)
            histeq_img(i,j)= new_intensities(img(i,j)+1);
        end
    end
    
end