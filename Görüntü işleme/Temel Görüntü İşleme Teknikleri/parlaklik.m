function [sonuc] = parlaklik(I,oran)
    [n,m,l] = size(I);
    oran2 = oran;
    sonuc= I;
    for i=1:n
        for j=1:m
            for k=1:l
            
                    sonuc(i,j,k) = I(i,j,k) + oran2;
                    if(sonuc(i,j,k)+oran2 > 255)
                        sonuc(i,j,k) = 200;
                    end
                    if(sonuc(i,j,k)+oran2 < 0)
                        sonuc(i,j,k) = 0;
                    end
            end
        end
    end
    subplot(2,1,1);
    imshow(I);
    subplot(2,1,2);
    imshow(sonuc);
end