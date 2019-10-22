clc;
clear all;
vidObj = VideoReader ('kedi.mp4');
H = vidObj.Height; % Height
W = vidObj.Width;  % Width
%% Frame'leri tek tek struct'a terleþtirme
s1 = struct('cdata',zeros(H,W,3,'uint8'),'colormap',[]); % Orijinal frame'ler
s2 = struct('cdata',zeros(H,W,3,'uint8'),'colormap',[]); % Gürültü eklenecek frame'ler
s3 = struct('cdata',zeros(H,W,3,'uint8'),'colormap',[]); % De-noise edilecek frame'ler.

%% Orijinal Frame'leri oku
k = 1;
while hasFrame(vidObj)
    s1(k).cdata = readFrame(vidObj);
    k = k+1;
end
k=k-1;
%% Gürültüleme
s2=s1; % s1'i klonlayalým. 
sayac = 0;
for i=k:-1:1
    sayac = sayac +1;
    s2(sayac) = s1(i); 
end
%% De-noising (s2'yi gürültüden arýndýrýp s3'e aktarýyoruz.)
for i=1:k-2
    s3(i).cdata = medfilt3(s2(i).cdata); % imboxfilt3 medfilt3 imgaussfilt3
end
%% VÝDEO OYNATMA
movie(s1,1,30); % s1'yi 1 kez sn'de 30 frame gelecek þekilde (fps) oynat
movie(s2,1,30);
movie(s3,1,30);

%% 10.-20. frame'ler arasýný görüntüler
for i=10:20
    % imshow(s(k).cdata)
    image(s1(i).cdata)
end

%% Seçtiðin süreler arasýný görüntüler
vidObj.CurrentTime = 0.0;
k = 1;
while vidObj.CurrentTime <= 0.9
    s2(k).cdata = readFrame(vidObj);
    k = k+1;
end
