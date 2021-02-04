img = imread('result.jpg');

%การอ่านค่าสีของรูปภาพ 
im_red = img(:, :, 1);
im_green = img(:, :, 2);
im_blue = img(:, :, 3);

% รวมภาพ 3 รูป
rgbImage = cat(3, im_red, im_green, im_blue);
imshow(rgbImage)