%D�n�m yani kenarlar�n birle�im noktas�n� referans alarak i�lem yapar.
I = imread('cocuk.jpg');
I = rgb2gray(I);
C = corner(I);
imshow(I);
hold on 
plot(C(:,1), C(:,2), 'r+');