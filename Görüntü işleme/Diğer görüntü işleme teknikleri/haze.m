I = imread('cocuk.jpg');
I = rgb2gray(I);
B = imreducehaze(I);
figure, imshowpair(I, B, 'montage')