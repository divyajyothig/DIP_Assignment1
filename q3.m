clc;
clear all;
close all;

im = imread('chip.png');
figure, imshow(im);
I = im2double(im);

% Logarithmic
j1 = 25*log(1+I);
figure, imshow(j1)

% Power-law transformation
c = 1;
y = 0.4;
s = zeros(size(im));
for i = 1:size(im,1)
    for j = 1:size(im,2)
        s(i,j) = c * (I(i,j).^y);
    end
end
figure,imshow(s)

% Contrast stretching
m = mean2(I);
cont1 = 1./(1 + (m ./(I + eps )).^2);
figure, imshow(cont1)

% Histogram equalization
X = histogram_eq(im);
figure, imshow(X)

% Log transformation and Power law transformation 
lp = zeros(size(im));
for i = 1:size(im,1)
    for j = 1:size(im,2)
          lp(i,j) =  c * (j1(i,j).^y); 
    end
end
figure, imshow(lp)