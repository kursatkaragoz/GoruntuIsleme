function[sonuc] = kucultme(I)
    [n,m,l] = size(I);
    sonuc = zeros(n/2,m/2,l);
    
    for i=1:n-1
        for j=1:m-1
            for k=1:l
                sonuc(i,j,k) = (I(i*2,j*2,k)+I(i*2,j*2+1,k)+I(i*2+1,j*2,k)+I(i*2+1,j*2+1,k))/4;
            end
        end
        sonuc = uint8(sonuc);
    end
    
    subplot(2,1,1);
    imshow(I);
    subplot(2,1,2);
    imshow(sonuc);
    

end