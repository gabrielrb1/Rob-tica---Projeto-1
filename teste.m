close all
clear all
clc

cam = webcam('HD Pro Webcam C920');
cam.Resolution = '2304x1536';
imrgb = snapshot(cam);
%imrgb = imread('foto_real.jpg');
img_hsv = rgb2hsv(imrgb);
imshow(img_hsv);
[x,y] = ginput(2);
imcortada = img_hsv(y(1):y(2),x(1):x(2));
figure
imshow(imcortada);
img_h = imcortada(:,:,1);
%img_s = imcortada(:,:,2);
%img_v = imcortada(:,:,3);

max(max(img_h))
min(min(img_h))