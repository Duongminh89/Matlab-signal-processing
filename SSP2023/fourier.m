
function [Y,fs]=fourier(y,fv,L);
NFFT=2^nextpow2(L);
Y0=fft(y,NFFT)/L;
fs=fv/2*linspace(0,1,NFFT/2+1);
Y=abs(Y0(1:NFFT/2+1));