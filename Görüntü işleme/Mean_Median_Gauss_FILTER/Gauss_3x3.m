%Gauss Filter 3x3
%Bu yöntem normal daðýlým olarak da adlandýrýlýr.
%Bu yumuþatma yöntemi görüntleri bulanýklaþtýrmak, ayrýntý ve gürültüyü
%ortadan kaldýrmak için 2 boyutlu konvolüsyon (çekirdek matris ile resim
%üzerindeki piksellerin çarpýmý iþlemi) operatörüdür. Bu anlamda mean filter'a benzer. 
%Ancak gauss çan þeklinde grafikle temsil edilebilecek farklý bir
%çekirdek(matris) kullanýlýr.

function [GF3] =Gauss_3x3(I)

    GF3=I;
    sigma = 1.7;      % Daðýlýmýn Standart Sapmasý Belirlendi.
    kernel = zeros(3,3);
    toplam_cekirdek = 0;
    for i=1:3
        for j=1:3
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
                temp = Im(i:i+2 , j:j+2 );
                temp = double(temp);
                conv = temp.*kernel;
                output(i,j) = sum(conv(:));
        end
    end
    GF3 = uint8(output);




