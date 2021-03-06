close all
clear all
clc

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
maxI = cell(1,3);
minI = cell(1,3);
for ii=1:3
    [x,y] = ginput(2);
    imcortada = img_hsv(y(1):y(2),x(1):x(2));
    %figure
    %imshow(imcortada);
    img_h = imcortada(:,:,1);
    %img_s = imcortada(:,:,2);
    %img_v = imcortada(:,:,3);

    maxI{ii} = max(max(img_h));
    minI{ii} = min(min(img_h));
end
close(gcf);
