% load image
% double 2D
im_red = double(imread('red.jpg'));
im_green = double(imread('green.jpg'));
im_blue = double(imread('blue.jpg'));

%figure;
%subplot 131; imshow(im_red./255); %subplot xyp : p = position 
%subplot 132; imshow(im_green./255); %ต้องหาร./255 เพราะ ใช้ double
%subplot 133; imshow(im_blue./255);

% specify image width and height
im_width = 1000;
im_height = 1000;


% crop im_red
[h, w, ~] = size(im_red);
w_left = floor(abs(w-im_width)/2); %หาค่าเริ่มต้นฝั่งซ้าย
w_right = abs(w-im_width) - w_left+1; %หาค่าสิ้นสุดฝั่งขวา

h_up = floor(abs(h-im_height)/2); %หาค่าเริ่มต้นฝั่งซ้าย
h_down = abs(h-im_height) - h_up+1; %หาค่าสิ้นสุดฝั่งขวา

cim_red = im_red(h_up:h-h_down, w_left:w-w_right);

% crop im_green
[h, w, ~] = size(im_green);
w_left = floor(abs(w-im_width)/2);
w_right = abs(w-im_width) - w_left+1;

h_up = floor(abs(h-im_height)/2);
h_down = abs(h-im_height) - h_up+1;

cim_green = im_green(h_up:h-h_down, w_left:w-w_right);

% crop im_blue
[h, w, ~] = size(im_blue);
w_left = floor(abs(w-im_width)/2);
w_right = abs(w-im_width) - w_left+1;

h_up = floor(abs(h-im_height)/2);
h_down = abs(h-im_height) - h_up+1;

cim_blue = im_blue(h_up:h-h_down, w_left:w-w_right);


% define step range
MAX_STEPS = 100; 

start_rows = im_height/2 - MAX_STEPS;
end_rows = start_rows + (MAX_STEPS*2) - 1;

start_cols = im_width/2 - MAX_STEPS;
end_cols =  start_cols + (MAX_STEPS*2) - 1;
% จะได้ค่าขนาด 200*200

% extract red patch
red_patch = cim_red(start_rows:end_rows, start_cols:end_cols);       
green_dist = realmax;
blue_dist = realmax;

green_rows = 0;
green_cols = 0;

blue_rows = 0;
blue_cols = 0;

for rows = -MAX_STEPS:MAX_STEPS
    
    start_rows = im_height/2 + rows;
    end_rows = start_rows + (MAX_STEPS*2) - 1;   
    
    for cols = -MAX_STEPS:MAX_STEPS
        start_cols = im_width/2 + cols;
        end_cols =  start_cols + (MAX_STEPS*2) - 1;
        
% green patch
        green_patch = cim_green(start_rows:end_rows, start_cols:end_cols);
        green_tmp = norm(red_patch(:) - green_patch(:));
        % ใช้เก็บค่าตำแหน่งที่ทำในนอมน้อยสุด
        if green_tmp < green_dist
            green_dist = green_tmp;
            green_rows = start_rows;
            green_cols = start_cols;
            good_green = green_patch;
        end
        
    end        
end

for rows = -MAX_STEPS:MAX_STEPS
    
    start_rows = im_height/2 + rows;
    end_rows = start_rows + (MAX_STEPS*2) - 1;   
    
    for cols = -MAX_STEPS:MAX_STEPS
        start_cols = im_width/2 + cols;
        end_cols =  start_cols + (MAX_STEPS*2) - 1;
        
% blue patch
        blue_patch = cim_blue(start_rows:end_rows, start_cols:end_cols);
        blue_tmp = norm(good_green(:) - blue_patch(:));
        if blue_tmp < blue_dist
            blue_dist = blue_tmp;
            blue_rows = start_rows;
            blue_cols = start_cols;
        end
        
    end        
end

patch_result = zeros(MAX_STEPS*2, MAX_STEPS*2, 3); %ปูสีขาวขนาด 200*200*3 *3 คือ 3 แผ่น
patch_result(:,:,1) = red_patch; %เอาสีแดงที่ตัดมา ใส่ layer 1
patch_result(:,:,2) = cim_green(green_rows:green_rows+(MAX_STEPS*2)-1, green_cols:green_cols+(MAX_STEPS*2)-1); %เอาสีเขียวที่ตัดมา ใส่ layer 2
patch_result(:,:,3) = cim_blue(blue_rows:blue_rows+(MAX_STEPS*2)-1, blue_cols:blue_cols+(MAX_STEPS*2)-1); %เอาสีน้ำเงินที่ตัดมา ใส่ layer 3


im_result = zeros(im_height, im_width, 3);
im_result(:,:,1) = cim_red;


% green channel
start_rows = green_rows - (im_height/2 - MAX_STEPS);
start_cols = green_cols - (im_width/2 - MAX_STEPS);
im_result(1:im_height-start_rows, 1:im_width-start_cols,2) =  cim_green(start_rows:im_height-1, start_cols:im_height-1);

% blue channel
start_rows = blue_rows - (im_height/2 - MAX_STEPS);
start_cols = blue_cols - (im_width/2 - MAX_STEPS);
im_result(1:im_height-start_rows, 1:im_width-start_cols,3) =  cim_blue(start_rows:im_height-1, start_cols:im_height-1);

%figure; 
%subplot 151; imshow(red_patch./255);
%subplot 152; imshow(cim_green(green_rows:green_rows+(MAX_STEPS*2)-1, green_cols:green_cols+(MAX_STEPS*2)-1)./255);
%subplot 153; imshow(cim_blue(blue_rows:blue_rows+(MAX_STEPS*2)-1, blue_cols:blue_cols+(MAX_STEPS*2)-1)./255);
%subplot 154; imshow(patch_result./255);
%subplot 155; imshow(im_result./255);

figure, imshow(im_result./255);
pause; close all;
