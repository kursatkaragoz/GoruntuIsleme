clc;
clear all;
close all;
img = imread('lena.png');
I = img;
I=rgb2gray(img);

gurultu = gurultuEkle(I,10);
gurultu2 = imnoise(I,'salt & pepper',0.02);
gurultu=rgb2gray(gurultu);
gauss_5x5 = Gauss_5x5(I);
gauss_5x5_gurultu = Gauss_5x5(gurultu2);
gauss_3x3 = Gauss_3x3(I);
gauss_3x3_gurultu = Gauss_3x3(gurultu2);



figure(1);
%set(gcf,'Position',get(0,'Screensize'));
subplot(2,3,1);
imshow(I),title('Orjinal');
subplot(2,3,2);
imshow(gurultu2),title('Gürültü 30%');
subplot(2,3,3);
imshow(gauss_5x5),title('Orjinale 5x5 Sigma=1.7');
subplot(2,3,4);
imshow(gauss_5x5_gurultu),title('Gürültüye 5x5');
subplot(2,3,5);
imshow(gauss_3x3),title('Orjinale 3x3');
subplot(2,3,6);
imshow(gauss_3x3_gurultu),title('Gürültüye 3x3')







