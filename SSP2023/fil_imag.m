function [BW,BWN]=fil_imag(YN,Y,fs)
fs=3e8;
YNn=abs(YN)./max(abs(YN(:)));
filImag=medfilt2(YNn,[7 7]);
 BWN = imbinarize(filImag./max(filImag(:)), 0.15);

 Y=abs(Y)./max(abs(Y(:)));
filImag=medfilt2(Y,[7 7]);
 BW = imbinarize(filImag./max(filImag(:)), 0.15);
 [H,T,R]=hough(BW);
 P=houghpeaks(H,5);
 lines=houghlines(BW,T,R,P,'fillgap',3e-6*fs,'minlength',1e-6*fs);

