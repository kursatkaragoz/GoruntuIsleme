%Gauss Filter 3x3
%Bu y�ntem normal da��l�m olarak da adland�r�l�r.
%Bu yumu�atma y�ntemi g�r�ntleri bulan�kla�t�rmak, ayr�nt� ve g�r�lt�y�
%ortadan kald�rmak i�in 2 boyutlu konvol�syon (�ekirdek matris ile resim
%�zerindeki piksellerin �arp�m� i�lemi) operat�r�d�r. Bu anlamda mean filter'a benzer. 
%Ancak gauss �an �eklinde grafikle temsil edilebilecek farkl� bir
%�ekirdek(matris) kullan�l�r.

function [GF3] =Gauss_3x3(I)

    GF3=I;
    sigma = 1.7;      % Da��l�m�n Standart Sapmas� Belirlendi.
    kernel = zeros(3,3);
    toplam_cekirdek = 0;
    for i=1:3
        for j=1:3
            uzaklik_kare = (i-3)^2 + (j-3)^2; % Merkezden Herhangi bir uzakl���n karesi
            kernel(i,j) = exp(-1 * (uzaklik_kare) / (2*sigma*sigma));
            toplam_cekirdek = toplam_cekirdek + kernel(i,j);
        end
    end
    kernel = kernel / toplam_cekirdek;
    % Filtre , imageye uygulan�yor.
    [m,n] = size(I);
    output = zeros(m,n);
    Im = padarray(I,[2 2]);

    for i=1:m
        for j=1:n      
                temp = Im(i:i+2 , j:j+2 );
                temp = double(temp);
                conv = temp.*kernel;
                output(i,j) = sum(conv(:));
        end
    end
    GF3 = uint8(output);




