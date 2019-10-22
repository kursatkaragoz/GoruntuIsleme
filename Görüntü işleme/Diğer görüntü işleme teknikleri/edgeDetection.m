%Edge kenar olarak adlandýrýlýr. Kenarlarý referans alarak iþlemler yapar.

I = imread('a1.png');
%I = rgb2gray(I); % 2 katmanlý imageler için önce gray'e çeviriyoruz 
%(katman hatasýnda kullanýlýr)
BW1 = edge(I,'sobel');
BW2 = edge(I,'canny');
figure;
imshowpair(BW1,BW2,'montage')
title('Sobel Filter              Canny Filter');
