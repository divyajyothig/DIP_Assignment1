clc;
clear all;
close all;

im = imread('bell.jpg');
%figure, imshow(im);
R = im(:,:,1);
G = im(:,:,2);
B = im(:,:,3);

R = im2double(R);
G = im2double(G);
B = im2double(B);

%x = ones(2,2)/4;
%x = ones(3,3)/9;
%x = ones(5,5)/25;
%x = ones(10,10)/100;
x = ones(20,20)/400;
fR1 = conv2(R, x, 'same'); % smoothened R plane
fG1 = conv2(G, x, 'same'); % smoothened G plane
fB1 = conv2(B, x, 'same'); % smoothened B plane

fR = mat2gray(fR1);
fG = mat2gray(fG1);
fB = mat2gray(fB1);

gmR = imabsdiff(R, fR); % gmask of R
gmG = imabsdiff(G, fG); % gmask of G
gmB = imabsdiff(B, fB); % gmask of B

k = 2; 
gR = R + k.*gmR; % sharpened R plane of the image 
gG = G + k.*gmG; % sharpened G plane of the image
gB = B + k.*gmB; % sharpened B plane of the image

g = cat(3, gR, gG, gB); % Sharpened color image
figure, imshow(g)