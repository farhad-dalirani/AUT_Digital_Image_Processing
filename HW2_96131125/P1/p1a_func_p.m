function pixelated_img = p1a_func_p(img, output_size)
   % This function pixelates and input image
   % img: in input image
   % output_size: is a matrix in form [a, b, 3]
   % that is size of output image
   
   % initial an image as specified by argument 'output_size'
   pixelated_img = uint8(zeros(size(img)));
   
   % how many pixel in x axis should group to each 
   % other to make a new pixel
   group_x = size(img, 1)/output_size(1, 1);
   
   % how many pixel in x axis should group to each 
   % other to make a new pixel
   group_y = size(img, 2)/output_size(1, 2);
   
   for i = 1:output_size(1,1)
      for j = 1:output_size(1,2)
          
          start_x = (i-1)*group_x + 1;
          end_x = start_x + group_x - 1;
          start_x = floor(start_x);
          end_x = floor(end_x);
          if end_x > size(img,1)
              end_x = size(img,1);
          end
          
          start_y = (j-1)*group_y + 1;
          end_y = start_y + group_y - 1;
          start_y = floor(start_y);
          end_y = floor(end_y);
          if end_y > size(img,2)
              end_y = size(img,2);
          end
          
          % separate pixels that create pixel i,j of new image
          super_pixel = img(start_x:end_x, start_y:end_y,:);
          
          % mean of super pixel
          mean_of_super_pixel = sum(sum(super_pixel,1),2)/(size(super_pixel,1)*size(super_pixel,2));
          
          % assign average RGB to new pixel
          for p=start_x:end_x
             for q=start_y:end_y
                pixelated_img(p,q,:) =uint8(floor(mean_of_super_pixel));
             end
          end
          
          
      end
   end
   
end