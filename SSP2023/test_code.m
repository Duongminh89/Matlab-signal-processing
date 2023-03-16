clc;
clear all;
close all;
fs=3e8;         % sampling frequency
fc=5e6;         % center frequency
amp=1;          % amplitude
fm=0.5e6;       % modulate signal
k=0.5;
Top=30e-6;
fmin=0.5e6;
fmax=5.5e6;
ti=13e-6;
snR=5;
val=1;% 1 CW; 
iter=1;
fc2=3e6;
fmin2=1e6;
fmax2=10e6;
amp2=1;
tic;
for ii=1:length(snR)
    for jj=1:iter
        [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snR(ii),8,fc2,fmin2,fmax2,amp2);
         [Y,YN,Fv,~,~]=process_signal(y,ynoise,fs,2);
%         [u1,v1]=findpeaks(YN,Fv,"NPeaks",2,'MinPeakDistance',4.5e6,'MinPeakHeight',0.7e-1);
%         if ~isempty(v1)
%             if length(v1)>1
%                 fd(jj)=v1(2);
%             else
%                  fd(jj)=v1;
%             end
%         else
%             fd(jj)=100e6;
%         end
        YNn=abs(YN)./max(abs(YN(:)));
    filImag=medfilt2(abs(YN),[7 7]);
     BW = imbinarize(filImag./max(filImag(:)), 0.3);
     [H,T,R]=hough(BW);
     P=houghpeaks(H,5);
     lines = houghlines(BW,T,R,P);
     coord = [lines(:).point1; lines(:).point2];
%     bWidth = Fv(coord(1,2)) - Fv(coord(1,4));
%     bf(jj)=abs(bWidth);
     end
%     BF(ii)=sum(bf)/iter;
%     end
%     [kk,hh]=find(fd>=fc2 & fd<=(fmax+fc));
%     Err(ii)=length(kk)*100/iter;
end
 tk=toc
%  imagesc(t*1e6,Fv*1e-6, abs(YN)); %colormap(gray); hold on
% ylabel('Frequency (MHz)')
% xlabel('Time(\mus)')
% title('Hough transform - detected lines')
axis([0 max(t)*1e6 -150 30])
hold on;
for ii = 1:2:size(lines,2)
    coord(:,ii)
    plot(t(coord(:,ii))*1e6, Fv(coord(:,ii+1))*1e-6,'LineWidth',2,'Color','green');
    Fv(coord(:,ii))*1e-6
end


