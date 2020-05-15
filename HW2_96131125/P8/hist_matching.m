function hist_match_img = hist_matching(img, img_ref)
    % This function gets two images then it applies 
    % histogram matching on first image. img_ref is
    % the picture that functions tries to turn histogram of img like it
    
    % an array for holding the number of repetition of each intensity of input image.
    count_intensities_s = double(zeros(1, 256));
    
    % count repetition of each intensity of input image
    for i=1:size(img,1)
        for j=1:size(img,2)
            count_intensities_s(1,img(i,j)+1)= count_intensities_s(1,img(i,j)+1)+1;
        end
    end
    
    % calculate probability of occurrence of each intensity in input image
    prob_intensities_s = count_intensities_s / (size(img,1)*size(img,2));
    
    cumulative_prob_inten_s = prob_intensities_s;
    % calculate cumulative sum of intensities probability
    for i=2:size(cumulative_prob_inten_s,2)
        cumulative_prob_inten_s(1,i) = cumulative_prob_inten_s(1,i)+cumulative_prob_inten_s(1,i-1);
    end
    
    % calculate new intensity replacment of each intensity by
    % multiplying cumulative sum of intensities probabilities by  255
    new_intensities_s = cumulative_prob_inten_s * 255;
    
    % round 
    new_intensities_s = uint8(round(new_intensities_s));
    
    %=======================
    % an array for holding the number of repetition of each intensity of refrence image.
    count_intensities_g = double(zeros(1, 256));
    
    % count repetition of each intensity of input image
    for i=1:size(img_ref,1)
        for j=1:size(img_ref,2)
            count_intensities_g(1,img_ref(i,j)+1)= count_intensities_g(1,img_ref(i,j)+1)+1;
        end
    end
    
    % calculate probability of occurrence of each intensity in refrence image
    prob_intensities_g = count_intensities_g / (size(img_ref,1)*size(img_ref,2));
    
    cumulative_prob_inten_g = prob_intensities_g;
    % calculate cumulative sum of intensities probability
    for i=2:size(cumulative_prob_inten_g,2)
        cumulative_prob_inten_g(1,i) = cumulative_prob_inten_g(1,i)+cumulative_prob_inten_g(1,i-1);
    end
    
    % calculate new intensity replacment of each intensity by
    % multiplying cumulative sum of intensities probabilities by  255
    new_intensities_g = cumulative_prob_inten_g * 255;
    
    % round 
    new_intensities_g = uint8(round(new_intensities_g));
    
    %=======================
    
    % create intensity map
    intensity_map = zeros(1,256);
    for i= 1:256
        
        min_value = 10000;
        min_index = 10000;
        
        for j= 1:256
           if abs(new_intensities_s(i) - new_intensities_g(j)) < min_value
                min_value = abs(new_intensities_s(i) - new_intensities_g(j));
                min_index = j;
           end
        end
        
        intensity_map(i) = min_index;
        
    end
        
    
    
    % replace previous intensities with new ones
    hist_match_img = img;
    for i=1:size(img, 1)
        for j=1:size(img, 2)
            hist_match_img(i,j)= intensity_map(img(i,j)+1);
        end
    end
    
end