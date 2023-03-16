function [y,ynoise,t]=gen_sig(fs,fc,amp,fm,k,fmin,fmax,Top,ti,snR,val,fc2,fmin2,fmax2,amp2);
t=0:1/fs:Top-1/fs;
%SNR=10^(snR/10);
%noise=randn(1,length(t))+j*randn(1,length(t));
tt=0:1/fs:ti-1/fs;
switch val
    case 1
        y=amp*exp(2*pi*fc*t*j); % 1 CW
    case 2
        yk=amp*exp(2*pi*fc*tt*j); % Radio
        y=zeros(1,length(t));
        y(1:length(tt))=yk;
    case 3
        y=amp*cos(2*pi*fc*t).*(1+k*cos(2*pi*fm*t)); % AM
    case 4
        y=amp*cos(2*pi*fc*t+k*cos(2*pi*fm*t)); % FM
    case 5
        [~,y,~]=LFM_signal(Top,fs,fmax,fmin,fc,ti,0,amp); % LFM
    case 6
       barker=13;
        [~,y,~] = BPSK_mod(barker,fc,1/ti,fs,amp,Top); % BPSK
    case 7
        [~,y]=costas_frequency(fmax,fc,fmin,fs,ti,Top,amp); % Costas
    case 8
        [~,y1,~]=LFM_signal(Top,fs,fmax,fmin,fc,ti,0,amp); % two LFM
         [~,y2,~]=LFM_signal(Top,fs,fmax2,fmin2,fc2,ti,.5*ti,amp);
         y=y1+y2;
    case 9
        y2=amp2*exp(2*pi*fc2*t*j);
        [~,y1,~]=LFM_signal(Top,fs,fmax,fmin,fc,ti,0,amp); %LFM+CW
        y=y1+y2;
    case 10
       barker=13;
       tir=13e-6;
        [~,y2,~] = BPSK_mod(barker,fc2,1/tir,fs,amp2,Top); % LFM+BPSK
        [~,y1,~]=LFM_signal(Top,fs,fmax,fmin,fc,ti,0,amp);
        y=y1+y2;

end
noise1=(randn(size(y))*std(y)+j*mean(y)*randn(size(y)))/db2mag(snR);
 noise2=(std(y)*raylrnd(1,length(y),1)+j*mean(y)*raylrnd(1,length(y),1))/db2mag(snR);
noise=noise1+noise2.';
ynoise= y+noise;
SN=snr(y,noise);


