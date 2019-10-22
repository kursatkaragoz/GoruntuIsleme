clc;
clear all;
vidObj = VideoReader ('kedi.mp4');
H = vidObj.Height; % Height
W = vidObj.Width;  % Width
%% Frame'leri tek tek struct'a terleþtirme
s1 = struct('cdata',zeros(H,W,3,'uint8'),'colormap',[]); % Orijinal frameler
s2 = struct('cdata',zeros(H,W,3,'uint8'),'colormap',[]); % TERSTEN oynatma için frameler
s3 = struct('cdata',zeros(H,W,3,'uint8'),'colormap',[]); % GRAY Scale için frameler
s4 = struct('cdata',zeros(H,W,3,'uint8'),'colormap',[]); % GÜRÜLTÜ  Scale için frameler
s5 = struct('cdata',zeros(H,W,3,'uint8'),'colormap',[]); % Gürültü + Median 3x3 için frameler

%% Orijinal Frame'leri oku
k = 1;
while hasFrame(vidObj)
    s1(k).cdata = readFrame(vidObj);
    k = k+1;
end
k=k-1;
%% Videoyu Tersten Oynatma ve Kaydetme
yazilacaktekrar = VideoWriter('TerstenVideo.avi','Uncompressed AVI');
yazilacaktekrar.FrameRate = vidObj.FrameRate;
i=1;

sayici = 1;
s2=s1; % s1'i klonlayalým. 
for i=k:-1:1
    s2(sayici) = s1(i);
    sayici=sayici+1;
end
open(yazilacaktekrar);
for f=1:k
    writeVideo(yazilacaktekrar,s2(f));
end
close(yazilacaktekrar);


%% Videoya Gürültü Ekleme ve Kaydetme
yazilacak = VideoWriter('GürültülüVideo.avi','Uncompressed AVI');
yazilacak.FrameRate = vidObj.FrameRate;
s4=s1; % s1'i klonlayalým. 
for i=1:k
    
    x=imnoise(s4(i).cdata,'salt & pepper',0.02); %0.02 oranýnda tuz ve biber ekleniyor
    s4(i).cdata = x;
end
open(yazilacak);
for i=1:k
    writeVideo(yazilacak,s4(i).cdata);   %her bir veri tek tek yazilacak isimli kalýba yazýlýyor.
end
close(yazilacak);



%% Gürültülü Videoyu Median 3x3 ile temizleme
yazilacak4 = VideoWriter('GürültülüVideoTemizlenmis.avi','Uncompressed AVI');
yazilacak4.FrameRate = vidObj.FrameRate;
s5=s1; % s1'i klonlayalým. 
for i=1:k
    
    s5(i).cdata = medfilt3(s4(i).cdata);
end
open(yazilacak4);
for i=1:k
    writeVideo(yazilacak4,s5(i).cdata);
end
close(yazilacak4);




%% Contrast Alma VE VÝDEOSUNU KAYDETME
yazilacakGray = VideoWriter('ContrastVideo.avi','Uncompressed AVI');
yazilacakGray.FrameRate = vidObj.FrameRate;
s3=s1; % s1'i klonlayalým. 
for i=1:k
    
    x=s3(i).cdata;
    x=255-x;
    s3(i).cdata = x;
end
open(yazilacakGray);
for i=1:k
    writeVideo(yazilacakGray,s3(i).cdata);
end
close(yazilacakGray);