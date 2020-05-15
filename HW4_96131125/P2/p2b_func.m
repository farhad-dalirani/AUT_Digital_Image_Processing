function noisy_img = p2b_func(img, pa, pb)
    % This function adds salt and pepper noise to image.
    % img is an image with pixels value in range [0,1]
    % pa, probability of pepper noise
    % Pb, probability of salt noise
    
    noisy_img = img;
    
    % crop values higher than 1 and lower than 0
    for i=1:size(noisy_img,1)
        for j=1:size(noisy_img,2)
            
            % generate an random number between 0 and 1
            rand_num = rand();
            
            % add salt and pepper noise
            if rand_num < pa
                noisy_img(i, j) = 0;
            else
                if rand_num < pa+pb
                    noisy_img(i, j) = 1;
                end
            end
        end
    end
    
end