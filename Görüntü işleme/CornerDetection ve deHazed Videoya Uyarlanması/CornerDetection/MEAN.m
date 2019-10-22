clc;
clear all;
close all;
vidObj = VideoReader ('videoplayback.mp4');
H = vidObj.Height; % Height
W = vidObj.Width;  % Width
s1 = struct('cdata',zeros(H,W,3,'uint8'),'colormap',[]); % Orijinal frameler
s4 = struct('cdata',zeros(H,W,3,'uint8'),'colormap',[]); % CornerDetection için FRAMELER
k = 1;
while hasFrame(vidObj)
    s1(k).cdata = readFrame(vidObj);
    k = k+1;
end
k=k-1;

%% Videoya Corner Detection iþlemi uygulama
yazilacak = VideoWriter('CornerDetectionOutput.avi','Uncompressed AVI');
yazilacak.FrameRate = vidObj.FrameRate;
s4=s1; % s1'i klonlayalým.

for i=1:k
    x= s1(i).cdata;
    x = rgb2gray(x);
    x = CornerYerliFonksiyon(x);
    x= double(x);
    s4(i).cdata = x;
end

open(yazilacak);
for i=1:k
    
    writeVideo(yazilacak,s4(i).cdata);
end
close(yazilacak);