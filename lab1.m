red = imread('red.jpg');
green = imread('green.jpg');
blue = imread('blue.jpg');
figure,imshow(red);
figure,imshow(green);
figure,imshow(blue);

rgbImage = cat(3, red, green, blue);
imshow(rgbImage)