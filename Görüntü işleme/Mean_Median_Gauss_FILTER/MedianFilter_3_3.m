% Median filter kom�u piksellerin de�erlerini al�p bunlar� s�ralamaya t�bi
% tutarak, s�ralamadaki ortanca de�eri i�lemesiyle bilinir.
%ortanca de�eri esas alarak g�r�nt�n�n orjinaline yani esas�na en yak�n
%piksel de�erini hedefler.
%Dezavantaju b�y�k boyutlarda g�r�lt� varsa bu filtrenin k���k maskeleri
%pek i� g�rmez bunun yan� s�ra gauss filter'a g�re �ok daha yava�
%�al��maktad�r. Hesaplama maliyeti y�ksektir.

%Bu �rnekte maske boyutu 3x3 olarak belirlenmi�tir.

function [mI] =MedianFilter(I)
    [n,m,k] = size(I);
    mI=I;
    for i1= 2:n-1
        for i2= 2:m-1
            for i3 = 1:k
                
     x=median(sort(     [I(i1-1,i2-1,i3) ...
                         I(i1,i2-1,i3)...
                         I(i1+1,i2-1,i3)...
                         I(i1-1,i2,i3)...
                         I(i1+1,i2,i3)...
                         I(i1-1,i2+1,i3)...
                         I(i1,i2+1,i3)...
                         I(i1+1,i2+1,i3)]));
      mI(i1,i2,i3) = uint8(x);
                 
                

            end
        end
    end

 
end

