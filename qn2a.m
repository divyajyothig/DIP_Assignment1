clc;
clear all;
close all;

A=imread('office.jpg');
figure,imshow(A);
R = A(:,:,1);
G = A(:,:,2);
B = A(:,:,3);
eqR = histogram_eq(R);
eqG = histogram_eq(G);
eqB = histogram_eq(B);
eqhist = cat(3, eqR, eqG, eqB);
figure, imshow(eqhist)

figure,subplot(1,2,1)
imhist(R)
subplot(1,2,2)
imhist(eqR)

figure, subplot(1,2,1)
imhist(G)
subplot(1,2,2)
imhist(eqG)

figure, subplot(1,2,1)
imhist(B)
subplot(1,2,2)
imhist(eqB)