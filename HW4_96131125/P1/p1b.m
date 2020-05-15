% read image
input_img = imread('bars.png');

% intesity that is used for padding value
pad_value = 0;

% size of filter
filt_size_array = [3, 7, 9];

% for different filter size
for filt_size_i = 1:3

    % size of filter 
    filt_size = filt_size_array(filt_size_i);

    % half of length of filter
    filt_half_len = floor(filt_size/2);

    img = double(input_img);

    % pad image with specific value
    % pad left and right size
    img = [ones(size(img,1), filt_half_len)*pad_value, img,ones(size(img,1), filt_half_len)*pad_value];
    % pad above and down 
    img = [ones(filt_half_len, size(img,2))*pad_value; img;ones(filt_half_len, size(img,2))*pad_value];

    % Create an image for result
    filtered_imgage = img;

    % location of input image inside padded image
    point1 = [filt_half_len+1, filt_half_len+1];
    point2 = [size(img,1)-filt_half_len, size(img,2)-filt_half_len];

    % Apply filter (Geometric Filter) 
    for i=(point1(1,1)):(point2(1,1))
        for j=(point1(1,2)):(point2(1,2))

            % neighbourhood of point (i,j)
            neighborhood = img(i-filt_half_len:i+filt_half_len, j-filt_half_len:j+filt_half_len);

            % Geometric Filter
            filter_i_j =  prod(prod(neighborhood, 1),2)^ (1/((size(neighborhood,1)*size(neighborhood,2))));

            % assign new intesity to pixel i,j
            filtered_imgage(i, j) = uint8(filter_i_j);

        end
    end

    % eliminate padding
    filtered_imgage = uint8(filtered_imgage(point1(1,1):point2(1,1),point1(1,2):point2(1,2)));

    % display results
    figure();
    imshow(input_img);
    title('Input Image');
    figure();
    imshow(filtered_imgage);
    title(strcat('Filtered Image ', num2str(filt_size)));
    imwrite(filtered_imgage, strcat('p1b_', num2str(filt_size),'.png'))
end