originalBW = imread('cameraman.tif');
%originalBW = rgb2gray(I);
se = strel('line',11,90);
BW2 = imerode(originalBW,se);
BW3 = imdilate(originalBW,se);

figure
subplot(1,3,1);
xlabel('orjinal');
imshow(originalBW );
subplot(1,3,2);
xlabel('erazyon');
imshow(BW2 );
subplot(1,3,3);
xlabel('dilation');
imshow(BW3 );