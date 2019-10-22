function[sonuc] = simetriAl(I)
    
    [n,m,l] = size(I);
    sonuc= I;
    for i=1:n
        for j=1:m
            for k=1:l
                
                sonuc(n-i+1,j,k) = I(i,j,k);
            end
        end
    end
    subplot(2,1,1);
    imshow(I);
    subplot(2,1,2);
    imshow(sonuc);

end