function [sonuc] = rgb_dondur(I)
    [n,m,l] = size(I);
    sonuc = I;
    
    for i=1:n
        for j=1:m
           sonuc(i,j,1) = I(i,j,3);
           sonuc(i,j,2) = I(i,j,2);
           sonuc(i,j,3) = I(i,j,1);
        end
    end
    subplot(2,1,1);
    imshow(I);
    subplot(2,1,2);
    imshow(sonuc);
end