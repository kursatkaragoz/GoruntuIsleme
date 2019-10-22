I = imread('coins.png');
%figure
%imshow(I);
%title('Original Image');
BW = imbinarize(I);
%figure
%imshow(BW);
%title('Original Image Converted to Binary Image');
BW2 = imfill(BW,'holes');
%figure
%imshow(BW2);
%title('Filled Image');

subplot(1,3,1);
imshow(I );
subplot(1,3,2);
imshow(BW );
subplot(1,3,3);
imshow(BW2);
