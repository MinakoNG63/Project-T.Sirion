red = imread('red.jpg');
green = imread('green.jpg');
blue = imread('blue.jpg');
%แปลงให้เป็นภาพสีเทา
r = rgb2gray(red);
g = rgb2gray(green);
b = rgb2gray(blue);
%im_2 = red( 1:2:end, 1:2:end ); ไม่ใช้เพราะมันออกมา 3 ภาพ
im_small = imresize(red, 0.5);

figure,imshow(im_small);
