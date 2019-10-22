%Edge kenar olarak adland�r�l�r. Kenarlar� referans alarak i�lemler yapar.

I = imread('a1.png');
%I = rgb2gray(I); % 2 katmanl� imageler i�in �nce gray'e �eviriyoruz 
%(katman hatas�nda kullan�l�r)
BW1 = edge(I,'sobel');
BW2 = edge(I,'canny');
figure;
imshowpair(BW1,BW2,'montage')
title('Sobel Filter              Canny Filter');
