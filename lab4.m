red = imread('red.jpg');
green = imread('green.jpg');
blue = imread('blue.jpg');

[xr, yr] = size(red);
[xg, yg] = size(green);
[xb, yb] = size(blue);


min_x = min([xr, xg, xb]);
min_y = min([yr, yg, yb])/3;

%im = imcrop(green,[x1 y1 x2 y2]);
