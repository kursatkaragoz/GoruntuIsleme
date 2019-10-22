%Bu fonksiyondaki amaç herhangi bir (parametre) görüntüye belirli bir
%oranda (parametre) manuel olarak gürültü eklemektir.

function [sonuc]  = gurultuOlustur(I,oran)
    [n,m,l] = size(I);
    sonuc = I;
    oran2 = oran;
    noise=0;
    
    for i = 1:n
        for j=1:m
            ekle= randi(100);
            if(ekle <=oran2)
                if(randi(2) ==1)
                    noise = 255;
                else
                    noise=0;
                end
                sonuc(i,j,1) = noise;
                sonuc(i,j,2) = noise;
                sonuc(i,j,3) = noise;
            end
            
        end
    end
    subplot(2,1,1);
    imshow(I);
    subplot(2,1,2);
    imshow(sonuc);
end