clc;
clear all;
close all;
I = imread('kýz.jpg');
kirmizi = I(:,:,1);
yesil = I(:,:,2);
mavi = I(:,:,3);
%J = rgb2gray(I);
K=histeq(J);

subplot(1,3,1);
histogram(kirmizi), title('Kirmizi'); %imshow(sonuc),
subplot(1,3,2);
histogram(yesil), title('Yesil'); %imshow(sonuc),
subplot(1,3,3);
histogram(mavi), title('Mavi'); %imshow(sonuc),
