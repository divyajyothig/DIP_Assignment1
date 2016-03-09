clc;
clear;
close all;

A = imread('face.png');
figure, imshow(A);
A = double(A);
n = 5; % size of the filter
sig_d = 2;
sig_r = 20;
B = bilateral_filter(A,n,sig_d,sig_r);
figure, imshow(uint8(B));