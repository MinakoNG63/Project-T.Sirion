red = imread('red.jpg');
green = imread('green.jpg');
blue = imread('blue.jpg');
figure,imshow(red);
figure,imshow(green);
figure,imshow(blue);

rgbImage = cat(3, red, green, blue); %รวมภาพ แต่ยังรวมไม่ได้เพราะรูปไม่เท่ากัน
imshow(rgbImage) %error

------------------------------------

img = imread('result.jpg');

%การอ่านค่าสีของรูปภาพ 
im_red = img(:, :, 1);
im_green = img(:, :, 2);
im_blue = img(:, :, 3);

% รวมภาพ 3 รูป
rgbImage = cat(3, im_red, im_green, im_blue);
imshow(rgbImage)

---------------------------------------------

r = imread('red.jpg');
g = imread('green.jpg');
b = imread('blue.jpg');

%im_2 = red( 1:2:end, 1:2:end ); %ไม่ใช้เพราะมันออกมา 3 ภาพ
red = imresize(r, 0.5);
green = imresize(g, 0.5);
blue = imresize(b, 0.5);

[rr, cr] = size(red);
[rg, cg] = size(green);
[rb, cb] = size(blue);

min_x = min([xr, xg, xb]);  
min_y = min([yr, yg, yb])/3;

--------------------------------------------------------

red = imread('red.jpg');
green = imread('green.jpg');
blue = imread('blue.jpg');

[xr, yr, dr] = size(red);
[xg, yg, dr] = size(green);
[xb, yb, dr] = size(blue);


min_x = min([xr, xg, xb]);  
min_y = min([yr, yg, yb]);

%im = imcrop(green,[x1 y1 x2 y2]);
