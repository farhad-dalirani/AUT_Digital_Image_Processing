% read aut 1
aut1 = imread('aut1.jpg');

% show aut1 and its histogram
figure();
imshow(aut1);
title('aut1');
figure();
imhist(aut1);
title('histogram of aut1');
saveas(gcf, 'p8b-aut1-hist.png');

% read aut 1
aut2 = imread('aut2.jpg');

% show aut1 and its histogram
figure();
imshow(aut2);
title('aut2');
figure();
imhist(aut2);
title('histogram of aut2');
saveas(gcf, 'p8b-aut2-hist.png');


% call histogram matching
aut_2_matched = hist_matching(aut2, aut1);
figure();
imshow(aut_2_matched);
title('result of histogram matching');
imwrite(aut_2_matched, 'p8b_aut2_matched_hist.png');
figure();
imhist(aut_2_matched);
title('histogram of result of histogram matching');
saveas(gcf, 'p8b-aut-matched-hist.png');


