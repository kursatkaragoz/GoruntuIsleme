% Baz� durumlarda g�r�nt� g�r�lt�ye maruz kalm�� olabilir. G�r�lt� teknik olarak g�r�nt� �zerindeki
% bozukluklar, lekeler, eksiklikler olarak tan�mlanabilir. Bir say�sal g�r�nt�de g�r�lt�, p�r�zs�z
% y�zey �zerine rastgele da��lm�� lekeler yani piksel bozukluklar olarak nitelendirilir. Bu gibi 
% durumlar g�r�nt�n�n kalitesinde �nemli �l��de d���kl�k yarat�r.
% Bu durumda g�r�lt�n�n giderilmesi gerekir. G�r�lt� gidermenin y�ntemlerinden biriside MeanFilter
% y�ntemidir. 
% Bu durumda g�r�nt�y� yumu�atmak i�in bir piksel ile di�erleri aras�ndaki de�i�im miktar�n� azaltmak
% hedeftir. Mean filter bir piksel de�erini kom�ular�n�n sahip oldu�u ortalama de�er ile de�i�tirerek
% orjinale en yak�n g�r�nt�y� elde etmeyi ama�lar. Bu y�ntemde kullan�labilecek maske boyutlar� �nemlidir.
% maskelerin boyutlar� (3x3 , 5x5 , 7x7) �eklinde de�i�ebilir. Maske boyutu artt�k�a yumu�atma i�lemi de artar.
% Bu y�ntemin dez avantaj� ortalamalar sonucu bulunan de�erler orjinal g�r�nt�y� yani beklenen g�r�nt�y�
% iyi derecede temsil etmez. Maske boyutu artt�k�a duruma g�re iyile�meler veya k�t�le�meler meydana gelebilir.
% Mean Filter y�ntemi d���nda median filter ve gauss filter y�ntemleride geli�tirilmi�tir. Yorumlanacak olursa
% gauss filter en iyi y�ntem olarak g�r�lmektedir fakat her g�r�nt� i�in en iyi sonucu gauss filter verir diye bir 
% sonu� odaklanamaz.


% Bu �rnekte maske olarak 3x3 maske kullan�lm��t�r.
% Fonksiyonu �al��t�rmak i�in ayn� dizinde bulunan bir g�r�nt�y� parametre
% olarak MeanFilter fonksiyonuna g�ndermek gerekmektedir.

function [F] =MeanFilter(I)
    [n,m,k] = size(I);
    F=I;
    for i1= 2:n-1
        for i2= 2:m-1
            for i3 = 1:k
                
                x=(     (I(i1-1,i2-1,i3)/8 + ...
                         I(i1,i2-1,i3)/8+...
                         I(i1+1,i2-1,i3)/8+...
                         I(i1-1,i2,i3)/8+...
                         I(i1+1,i2,i3)/8+...
                         I(i1-1,i2+1,i3)/8+...
                         I(i1,i2+1,i3)/8+...
                         I(i1+1,i2+1,i3)/8));
                F(i1,i2,i3) = (x);
            end
        end
    end
end

