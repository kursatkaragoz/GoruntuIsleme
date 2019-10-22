function [sonuc] = contrastAl(I)
    [n,m,l] = size(I);
    sonuc = I;
   
    for i=1:n
        for j=1:m
            for k=1:3
                sonuc(i,j,k)= 255-I(i,j,k);
            end
        end
    end
    subplot(2,1,1);
    imshow(I);
    subplot(2,1,2);
    imshow(sonuc);
end