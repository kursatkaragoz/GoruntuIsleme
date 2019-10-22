clc;
clear all;
vidObj = VideoReader ('sisliHavaOrjin.mp4');
H = vidObj.Height; % Height
W = vidObj.Width;  % Width
%% Frame'leri tek tek struct'a terleþtirme
s1 = struct('cdata',zeros(H,W,3,'uint8'),'colormap',[]); % Orijinal frameler
s2 = struct('cdata',zeros(H,W,3,'uint8'),'colormap',[]); % De Hazel oynatma için frameler

k = 1;
while hasFrame(vidObj)
    s1(k).cdata = readFrame(vidObj);
    k = k+1;
end
k = k-1;

%% Frameler OKunuyor ardýndan sisler kaldýrýlýyor ve tekrar frameler birleþtiriliyor,

yazilacak = VideoWriter('sisliHavaDEHAZED.avi','Uncompressed AVI');
yazilacak.FrameRate = vidObj.FrameRate;
s2=s1; % s1'i klonlayalým. 
for i=1:k
    x=imreducehaze(s2(i).cdata);
    s2(i).cdata = x;
end
open(yazilacak);
for i=1:k
    writeVideo(yazilacak,s2(i).cdata);
end
close(yazilacak);