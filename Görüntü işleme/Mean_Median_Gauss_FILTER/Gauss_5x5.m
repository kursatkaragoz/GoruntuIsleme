function [GF5] =Gauss_5x5(I)

    GF5=I;
    
    sigma = 1.7;      % Daðýlýmýn Standart Sapmasý Belirlendi.
    kernel = zeros(5,5);
    toplam_cekirdek = 0;
    for i=1:5
        for j=1:5
            uzaklik_kare = (i-3)^2 + (j-3)^2; % Merkezden Herhangi bir uzaklýðýn karesi
            kernel(i,j) = exp(-1 * (uzaklik_kare) / (2*sigma*sigma));
            toplam_cekirdek = toplam_cekirdek + kernel(i,j);
        end
    end
    kernel = kernel / toplam_cekirdek;
    % Filtre , imageye uygulanýyor.
    [m,n] = size(I);
    output = zeros(m,n);
    Im = padarray(I,[2 2]);

    for i=1:m
        for j=1:n      
                temp = Im(i:i+4 , j:j+4 );
                temp = double(temp);
                conv = temp.*kernel;
                output(i,j) = sum(conv(:));
        end
    end
    GF5 = uint8(output);


    

