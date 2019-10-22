% Bazý durumlarda görüntü gürültüye maruz kalmýþ olabilir. Gürültü teknik olarak görüntü üzerindeki
% bozukluklar, lekeler, eksiklikler olarak tanýmlanabilir. Bir sayýsal görüntüde gürültü, pürüzsüz
% yüzey üzerine rastgele daðýlmýþ lekeler yani piksel bozukluklar olarak nitelendirilir. Bu gibi 
% durumlar görüntünün kalitesinde önemli ölçüde düþüklük yaratýr.
% Bu durumda gürültünün giderilmesi gerekir. Gürültü gidermenin yöntemlerinden biriside MeanFilter
% yöntemidir. 
% Bu durumda görüntüyü yumuþatmak için bir piksel ile diðerleri arasýndaki deðiþim miktarýný azaltmak
% hedeftir. Mean filter bir piksel deðerini komþularýnýn sahip olduðu ortalama deðer ile deðiþtirerek
% orjinale en yakýn görüntüyü elde etmeyi amaçlar. Bu yöntemde kullanýlabilecek maske boyutlarý önemlidir.
% maskelerin boyutlarý (3x3 , 5x5 , 7x7) þeklinde deðiþebilir. Maske boyutu arttýkça yumuþatma iþlemi de artar.
% Bu yöntemin dez avantajý ortalamalar sonucu bulunan deðerler orjinal görüntüyü yani beklenen görüntüyü
% iyi derecede temsil etmez. Maske boyutu arttýkça duruma göre iyileþmeler veya kötüleþmeler meydana gelebilir.
% Mean Filter yöntemi dýþýnda median filter ve gauss filter yöntemleride geliþtirilmiþtir. Yorumlanacak olursa
% gauss filter en iyi yöntem olarak görülmektedir fakat her görüntü için en iyi sonucu gauss filter verir diye bir 
% sonuç odaklanamaz.


% Bu örnekte maske olarak 3x3 maske kullanýlmýþtýr.
% Fonksiyonu çalýþtýrmak için ayný dizinde bulunan bir görüntüyü parametre
% olarak MeanFilter fonksiyonuna göndermek gerekmektedir.

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

