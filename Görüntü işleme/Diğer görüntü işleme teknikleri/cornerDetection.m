%Dönüm yani kenarlarýn birleþim noktasýný referans alarak iþlem yapar.
I = imread('cocuk.jpg');
I = rgb2gray(I);
C = corner(I);
imshow(I);
hold on 
plot(C(:,1), C(:,2), 'r+');