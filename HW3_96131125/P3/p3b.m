paths = {'sketch.jpg','piano_keys.jpg','chessboard.jpg','trump_and_flag.jpg'};

for i=1:4
    % Read Image
    path_img = paths{i};
    img_org = imread(path_img);
    figure();
    imshow(img_org);
    title(strcat('Input Image', path_img));

    img = rgb2gray(img_org);
    img = im2double(img);

    % Calculate its Fourier Transform and shift origin to center 
    img_F = fftshift(fft2(img));    

    % Spectrom and phase angle
    img_spectrom = abs(img_F);

    % Phase angle
    img_phase = angle(img_F);

    % Plot Spectrom and Phase Angle
    figure();
    imshow(log10(img_spectrom+1))
    title(strcat('Spectrom',path_img))
    figure();
    imshow(img_phase)
    title(strcat('Phase',path_img))
    imwrite(log10(img_spectrom+1), strcat('p3b-', path_img,'-spectrum.png'));
    imwrite(img_phase, strcat('p3b-', path_img,'-phase.png'));
    
    % Inverse Fourier zero shift to left top
    % and Inverse Fourier Transform
    F_img = ifft2(ifftshift(img_F));

    % Plot Reconstructed Image
    figure()
    imshow(F_img)
    title('reconstruction of image from its Fourier Transform')
end