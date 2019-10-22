function [J] = gurultuEkle(I,oran)
    [n,m,~] = size(I);
    noise=0;
    J=I;
    for i1 = 1:n
        for i2 = 1:m
            ekle = randi(100);
            if ekle <=oran
                if randi(2) == 1
                    noise = 255;
                else
                    noise=0;
                end
                J(i1,i2,1) = noise;
                J(i1,i2,2) = noise;
                J(i1,i2,3) = noise;
            else
                continue;
            end
            
        end
    end
end

