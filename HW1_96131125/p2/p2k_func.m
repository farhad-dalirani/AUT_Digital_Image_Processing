function resized_img = p2k_func(img, factor)
    resized_img = [];
    
    
    if factor == 0.5
       % if factor is equal 0.5, allocate an imgage
       % with size half of input image
       resized_img = uint8(zeros(floor(size(img,1)/2),floor(size(img,2)/2)));
       
       %put a pixel from a row to a new image but ignore next pixel
       %put a pixel from a col to a new image but ignore next pixel
       i_prim=0;
       j_prim=0;
       for i=1:size(img,1)
          %ignore even rows
          if mod(i,2) == 0
          	continue;
          end
          i_prim = i_prim+1;
          j_prim = 0;
          for j=1:size(img,2)
              %ignore even columns
              if mod(j,2) == 0
                  continue
              end
              j_prim = j_prim+1;
         
              if i_prim<=size(resized_img,1) && j_prim<=size(resized_img,2)
                resized_img(i_prim, j_prim) = img(i,j);
              end
          end
          
       end
    elseif factor == 2
       % if factor is equal 2, allocate an imgage
       % with size  times of input image
       resized_img = uint8(zeros(floor(size(img,1)*2),floor(size(img,2)*2)));
       
       % between each two pixels in each row of input image insert a pixel and fill it
       % with average of them
       % between each two pixels in each col of input image insert a pixel and fill it
       % with average of them
       for i=1:size(img,1)
          for j=1:size(img,2)
            resized_img(2*i-1,j*2) = img(i,j);
            if j > 1
                resized_img(2*i-1,j*2-1) = uint8((uint32(img(i,j))+uint32(img(i,j-1)))/2);
            end
          end
          
          if i > 1
            resized_img(2*i-2,:) = uint8((uint32(resized_img(2*i-1,:))+uint32(resized_img(2*i-3,:)))/2); 
          end
          
       end
    end
    
end