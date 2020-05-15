function snr_value = p9_snr(image, target_image)
    % this function gets two images and it calculates
    % SNR of them. First image is noisy image, second 
    % image is target image (noise free). 
    % SNR(Signal-to-noise ratio) is defined as the ratio of the power of a signal 
    %(meaningful information) and the power of background noise (unwanted signal):
    
    snr_value = 10*log10(sum(sum(sum(double(image).^2)))/...
        sum(sum(sum((double(target_image-image)).^2))));
end