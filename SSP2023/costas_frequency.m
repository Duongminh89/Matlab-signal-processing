function [t,y]=costas_frequency(N,fc,fsp,fs,ti,Tmax,A);
dt=1/fs;
t=0:dt:Tmax-dt;
switch N
    case 1
        bit=[1 2 4 3];
    case 2
        bit=[2 1 5 3 4];
    case 3
        bit=[1 3 2 6 4 5];
    case 4
        bit=[4 7 1 6 5 2 3];
    case 5
        bit=[2 6 3 8 7 5 1 4];
end

tt=0:dt:ti-dt;
L=round(length(tt)/length(bit));
Fc=[];
for ii=1:length(bit)
Fc=[Fc; fc+bit(ii)*fsp];
end
%% generate MFSK
phase=0;
car=[];
for ii=1:length(bit)
    car=[car, A*cos(2*pi*Fc(ii)*tt(1:L)+phase)];
end
y=zeros(1,length(t));
y(1:length(car))=car;
