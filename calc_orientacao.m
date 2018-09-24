close all
clear all
clc
%Carregabdi img
%img_rgb = imread('foto_real.jpg');

cam = webcam('HD Pro Webcam C920');
cam.Resolution = '2304x1536';

for n = 1:2
     img_rgb = snapshot(cam);
     imshow(img_rgb)
end

% Convertendo para HSV
img_hsv = rgb2hsv(img_rgb);
imshow(img_rgb)
figure
%imshow(img_hsv)

%Separando HSV em camadas
img_h = img_hsv(:,:,1);
img_s = img_hsv(:,:,2);
img_v = img_hsv(:,:,3);

im_am = (img_h >= 0.1139) & (img_h <= 0.1323) & (img_s>0.1);% & (img_v > 0.7);
se1 = strel('rectangle',[9,9]);
im_am = imerode(im_am,se1);
im_am = imdilate(im_am,se1);
imshow(im_am);hold on;
stat1 = regionprops(im_am,'centroid');
plot(stat1.Centroid(1),stat1.Centroid(2),'ro');
% 
% im_az = (img_h >= 200/360) & (img_h <= 260/360)& (img_s>0.4) & (img_v > 0.8);
% figure
% se2 = strel('rectangle',[9,9]);
% im_az = imerode(im_az,se2);
% im_az = imdilate(im_az,se2);
% imshow(im_az);hold on;
% stat2 = regionprops(im_az,'centroid');
% plot(stat2.Centroid(1),stat2.Centroid(2),'ro');
% 
% figure
% xc=(stat1.Centroid(1)+stat2.Centroid(1))/2;
% yc=(stat1.Centroid(2)+stat2.Centroid(2))/2;
% im_to = im_az + im_am;
% imshow(im_to);hold on;
% plot(xc,yc,'ro');hold on;
% 
% tetay = stat1.Centroid(2)-stat2.Centroid(2);
% tetax = stat1.Centroid(1)-stat2.Centroid(1);
% 
% atan2d(-tetay,tetax)