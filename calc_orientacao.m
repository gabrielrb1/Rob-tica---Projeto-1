close all
clear all
clc
%Carregabdi img
%img_rgb = imread('foto_real.jpg');

cam = webcam('HD Pro Webcam C920');
cam.Resolution = '2304x1536';

imrgb = snapshot(cam);
%imrgb = imread('orientacao.jpg');
img_hsv = rgb2hsv(imrgb);
txt = cell(1,1);
txt{1,1} = ['Escolha na ordem:' newline '1- Frente', newline '2- Traseira', newline '3- Alvo'];
pos = [10 180];
image = insertText(img_hsv,pos,txt,'FontSize',50);
imshow(image);
for ii=1:3
    [x,y] = ginput(2);
    imcortada = img_hsv(y(1):y(2),x(1):x(2));
    %figure
    %imshow(imcortada);
    img_h = imcortada(:,:,1);
    %img_s = imcortada(:,:,2);
    %img_v = imcortada(:,:,3);

    maxI(ii) = max(max(img_h));
    minI(ii) = min(min(img_h));
end
close(gcf);

img_rgb = snapshot(cam);
imshow(img_rgb)


% Convertendo para HSV
img_hsv = rgb2hsv(img_rgb);
imshow(img_rgb)
figure
%imshow(img_hsv)

%Separando HSV em camadas
img_h = img_hsv(:,:,1);
img_s = img_hsv(:,:,2);
img_v = img_hsv(:,:,3);

im_am = (img_h >= minI(1)) & (img_h <= maxI(1)) & (img_s>0.1);% & (img_v > 0.7);
se1 = strel('rectangle',[9,9]);
im_am = imerode(im_am,se1);
im_am = imdilate(im_am,se1);
imshow(im_am);hold on;
stat1 = regionprops(im_am,'centroid');
plot(stat1.Centroid(1),stat1.Centroid(2),'ro');

im_az = (img_h >= minI(2)) & (img_h <= maxI(2))& (img_s>0.4);% & (img_v > 0.8)
se2 = strel('rectangle',[9,9]);
im_az = imerode(im_az,se2);
im_az = imdilate(im_az,se2);
imshow(im_az);hold on;
stat2 = regionprops(im_az,'centroid');
plot(stat2.Centroid(1),stat2.Centroid(2),'ro');
% 
% figure
% xc=(stat1.Centroid(1)+stat2.Centroid(1))/2;
% yc=(stat1.Centroid(2)+stat2.Centroid(2))/2;
% im_to = im_az + im_am;
% imshow(im_to);hold on;
% plot(xc,yc,'ro');hold on;
% 
tetay = stat1.Centroid(2)-stat2.Centroid(2);
tetax = stat1.Centroid(1)-stat2.Centroid(1);

atan2d(-tetay,tetax)