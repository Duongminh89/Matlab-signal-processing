function [t,y]=bfsk_mod(N,fc,fsp,fs,ti,Tmax,A)
% N: number of hopping
% fc: center frequency
% fsp: seperation frequency
% fs: sample frequency
% ti: pulse width
% Tmax: period
% A: amplitude
dt=1/fs;
t=0:dt:Tmax-dt;
bit=randi([0 1],1,N);
for ii=1:length(bit)
    if bit(ii)==0
        bit(ii)=-1;
    end
end
tt=0:dt:ti-dt;
L=round(length(tt)/N);
Fc=[];
for ii=-N/2+1:1:N/2
Fc=[Fc; fc+ii*fsp];
end
%% generate MFSK
phase=0;
car=[];
for ii=1:N
    car=[car, bit(ii)*A*cos(2*pi*Fc(ii)*tt(1:L)+phase)];
end
y=zeros(1,length(t));
y(1:length(car))=car;
