clc;
clear all;
close all;

A = imread('spot1-diff1.jpg');
B = imread('spot1-diff2.jpg');
% A = imread('spot2-diff1.png');
% B = imread('spot2-diff2.png');

g = imabsdiff(A,B);
%figure, imshow(g)

Ibw = im2bw(g,0.05); 
% converting to binary image so that wherever there is a  difference in 
% the image, it becomes of one color(white) and the rest the other color(black)

Ifill = imfill(Ibw,'holes');  
%figure, imshow(Ifill)

[Ilabel num] = bwlabel(Ifill); 

% Ilabel = Ifill contains some connected components which are separated
% from each other. The pixels that belong to the components is assigned an
% interger in Ilabel starting from 1. The pixels which are not part of 
% any components are given 0.
% num stores the total no. of connected components

figure, imshow(A)
hold on;
for cnt = 1:num
    s = regionprops(Ilabel, 'BoundingBox'); 
    rectangle('position', s(cnt).BoundingBox,'EdgeColor','r','linewidth',2);
end
hold off

% regionprops returns the set of properties specified
% BoundingBox - returns the smallest rectangle containing the connected
% component
% s will have the connected components. s(1) will have the first connected
% component. s(2) will have the second and so on.

figure, imshow(B)
hold on;
for cnt = 1:num
    s = regionprops(Ilabel, 'BoundingBox');
    rectangle('position', s(cnt).BoundingBox,'EdgeColor','r','linewidth',2);
end
hold off
