red = imread('red.jpg');
green = imread('green.jpg');
blue = imread('blue.jpg');

[XR, YR] = size(red)
I2 = imcrop(green,[1 1 1196-1 1068-1]);
figure,imshow(green);
figure,imshow(I2);
