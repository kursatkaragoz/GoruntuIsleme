% Median filter komþu piksellerin deðerlerini alýp bunlarý sýralamaya tâbi
% tutarak, sýralamadaki ortanca deðeri iþlemesiyle bilinir.
%ortanca deðeri esas alarak görüntünün orjinaline yani esasýna en yakýn
%piksel deðerini hedefler.
%Dezavantaju büyük boyutlarda gürültü varsa bu filtrenin küçük maskeleri
%pek iþ görmez bunun yaný sýra gauss filter'a göre çok daha yavaþ
%çalýþmaktadýr. Hesaplama maliyeti yüksektir.

%Bu örnekte maske boyutu 3x3 olarak belirlenmiþtir.

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

