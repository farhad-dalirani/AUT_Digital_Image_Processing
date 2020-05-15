% read refrence image
img_org = imread('viva_team_melli.png');
img_org = im2bw(img_org, 0.5);

% read modified image
img_morf = imread('viva_team_melli_e.png');
img_morf = im2bw(img_morf, 0.5);

% show images
%figure();
%subplot(1,2,1);
%imshow(img_org);
%title('Refrence Image');
%subplot(1,2,2);
%imshow(img_morf);
%title('Modified Image');

% check all posible (256) SE
matched_se = [];
min_mse = inf;
for i = 1:511
   % SE
   bin_i = de2bi(i,9,'left-msb');
   bin_matrix = reshape(bin_i, 3, 3);
   se = strel('arbitrary',bin_matrix);
   
   % apply structuring element
   img_close = imclose(img_org, se);
    
   cur_mse = (1/9)*sum(sum(((double(img_close)-double(img_morf)).^2)));
   
   % check for equality 
   if min_mse >= cur_mse
      min_mse = cur_mse;
      matched_se = se;
      matched_se_mat = bin_matrix;
      %disp('match SE');
      %disp(bin_matrix);
   end

end

% apply matched structuring element
img_close = imclose(img_org, matched_se);

% show result
% show images
figure();
set(gcf,'color','b');
subplot(2,2,1);
imshow(img_org);
title('Reference Image');
subplot(2,2,2);
imshow(img_morf);
title('Given Modified Image');
subplot(2,2,3);
imshow(img_close);
title('Image after applying proper SE');
subplot(2,2,4);
imshow(matched_se_mat);
title('proper SE');

saveas(gcf,'p4e.png')
