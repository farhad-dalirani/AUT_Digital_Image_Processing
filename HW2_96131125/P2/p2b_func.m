function censord = p2b_func(img, point1, point2, desired_res)
   % This function  gets an grayscale image and it censors a region that
   % specified by point1 and point2. It uses reducing resolution for censoring.
   % desired_res is new resolution of region.
     
   % initial an image
   pixelated_img = uint8(img);
   
   % how many pixel in x axis should group to each 
   % other to make a new pixel
   group_x = (point2(1,1)-point1(1,1))/desired_res(1, 1);
   
   % how many pixel in y axis should group to each 
   % other to make a new pixel
   group_y = (point2(1,2)-point1(1,2))/desired_res(1, 2);
   
   % for each new pixel in region that we want to ccensor, find
   % coresponding pixels and average of intensity
   for i = 1:desired_res(1,1)
      for j = 1:desired_res(1,2)
          
          start_x = (i-1)*group_x + 1;
          end_x = start_x + group_x - 1;
          start_x = floor(start_x);
          end_x = floor(end_x);
          if end_x > (point2(1,1)-point1(1,1))
              end_x = point2(1,1)-point1(1,1);
          end
          
          start_y = (j-1)*group_y + 1;
          end_y = start_y + group_y - 1;
          start_y = floor(start_y);
          end_y = floor(end_y);
          if end_y > (point2(1,2)-point1(1,2))
              end_y = point2(1,2)-point1(1,2);
          end
          
          % start and end points of new pixel in image
          x=[point1(1,1)+start_x, end_x+point1(1,1)];
          y=[point1(1,2)+start_y, end_y+point1(1,2)];
          
          % separate super pixel
          super_pixel = img(x(1,1):x(1,2), y(1,1):y(1,2));
          
          % mean Intensity of super pixel
          mean_of_super_pixel =sum(sum(super_pixel,1),2)/(size(super_pixel,1)*size(super_pixel,2));
          
          % assign average intensity to all point inside super pixel
          pixelated_img(x(1,1):x(1,2), y(1,1):y(1,2)) = uint8(floor(mean_of_super_pixel)*ones([size(super_pixel,1), size(super_pixel,2)]));
          
      end
   end
   
   censord = pixelated_img;
   
end