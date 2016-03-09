clc;
clear all;
close all;

A = imread('boy_smiling.jpg');
%figure, imshow(A);
A = double(A);
R = A(:,:,1);
G = A(:,:,2);
B = A(:,:,3);

n = 10; % size of the filter
sig_d = 2; 
sig_r = 70;
BR = bilateral_filter(R,n,sig_d,sig_r);
BG = bilateral_filter(G,n,sig_d,sig_r);
BB = bilateral_filter(B,n,sig_d,sig_r);

B = cat(3, BR, BG, BB);
figure, imshow(uint8(B))