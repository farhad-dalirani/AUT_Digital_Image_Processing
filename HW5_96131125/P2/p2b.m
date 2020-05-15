
methods = {'ezw','spiht','stw','wdr','aswdr'};

% for different methods
for i = 1:5
    total_psnr = 0;
    % for all images
    for img_i = 1:30
        % read image
        if img_i < 10
            path_img = strcat('C:\Users\Home\Dropbox\codes\DIP\HW5_96131125\P2\Trump Ties\trump_ties_0',...
            num2str(img_i),'.jpg');
        else
            path_img = strcat('C:\Users\Home\Dropbox\codes\DIP\HW5_96131125\P2\Trump Ties\trump_ties_',...
            num2str(img_i),'.jpg');
        end
        
        img = imread(path_img);
        
        % some of those methods need the size of image be power of two
        % pad image to the size of nearst 2^i
        img = padarray(img, [2^nextpow2(size(img,1))-size(img,1), 2^nextpow2(size(img,2))-size(img,2)], 0, 'post');
        imwrite(img, strcat('C:\Users\Home\Dropbox\codes\DIP\HW5_96131125\P2\padded_img\',num2str(img_i),'.jpg'));
        
        % compress
         path_img_cmp = strcat('C:\Users\Home\Dropbox\codes\DIP\HW5_96131125\P2\',methods{i},'\p2b-',...
            methods{i},'_trump_ties_', num2str(img_i),'.wtc');
        % compress
        wcompress('c', img, path_img_cmp, methods{i});
        % uncompress
        decomp_img = wcompress('u',path_img_cmp);
        % psnr
        total_psnr = total_psnr + psnr(decomp_img,img);
    end
    ave_psnr = total_psnr / 30.0;
    disp('average PSNR')
    disp(methods{i})
    disp(ave_psnr)
end
