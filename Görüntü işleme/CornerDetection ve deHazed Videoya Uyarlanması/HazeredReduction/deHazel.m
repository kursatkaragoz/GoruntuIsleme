clc;
clear all;
vidObj = VideoReader ('sisliHavaOrjin.mp4');
H = vidObj.Height; % Height
W = vidObj.Width;  % Width
%% Frame'leri tek tek struct'a terle�tirme
s1 = struct('cdata',zeros(H,W,3,'uint8'),'colormap',[]); % Orijinal frameler
s2 = struct('cdata',zeros(H,W,3,'uint8'),'colormap',[]); % De Hazel oynatma i�in frameler

k = 1;
while hasFrame(vidObj)
    s1(k).cdata = readFrame(vidObj);
    k = k+1;
end
k = k-1;

%% Frameler OKunuyor ard�ndan sisler kald�r�l�yor ve tekrar frameler birle�tiriliyor,

yazilacak = VideoWriter('sisliHavaDEHAZED.avi','Uncompressed AVI');
yazilacak.FrameRate = vidObj.FrameRate;
s2=s1; % s1'i klonlayal�m. 
for i=1:k
    x=imreducehaze(s2(i).cdata);
    s2(i).cdata = x;
end
open(yazilacak);
for i=1:k
    writeVideo(yazilacak,s2(i).cdata);
end
close(yazilacak);