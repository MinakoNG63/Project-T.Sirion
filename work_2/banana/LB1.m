img = imread('banana(95).jpg');


imHist = histogram(img(:,:,1),150);
redHist = imHist.Values;
imHist = histogram(img(:,:,2),150);
greenHist = imHist.Values;
imHist = histogram(img(:,:,3),150);
blueHist = imHist.Values;

figure;
subplot 311; bar(redHist, 'FaceColor', 'red');
subplot 312; bar(greenHist, 'FaceColor', 'green');
subplot 313; bar(blueHist, 'FaceColor', 'blue');

