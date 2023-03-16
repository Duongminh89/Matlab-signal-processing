function [Y,YN,Fv,t,tk]=process_signal(y,ynoise,fs,type);
tk=0;
tic;
switch type
    case 1
       [Y,~]=fourier(y,fs,length(y));

        [YN,Fv]=fourier(ynoise,fs,length(ynoise));
        t=0;
    case 2
         
%         [Y,~,~] = stft(real(y),fs,opts{:});
        win = hamming(16,"periodic");
       [Y,~,~]=stft(real(y),fs,'Window',kaiser(128,5),'OverlapLength',60,'FFTLength',512,'FrequencyRange','onesided');
       [YN,Fv,t]=stft(real(ynoise),fs,'Window',kaiser(128,5),'OverlapLength',60,'FFTLength',512,'FrequencyRange','onesided');
    
    case 4
        [Y,~] = cwt(real(y),fs);
        t=(0:length(y)-1)/fs;
        [YN,Fv] = cwt(real(ynoise),fs);
     
    case 3
%         [Y,~,~] =wvd(sig,Fs,'smoothedPseudo',hamming(4096,'periodic'),hamming(4096,'periodic'),'NumFrequencyPoints',500,'NumTimePoints',500);

        if mod(round(length(ynoise)/2),2)==0
            [YN,Fv,t] =wvd(real(ynoise),fs,'smoothedPseudo',kaiser(511,10),kaiser(511,10),'NumFrequencyPoints',round(length(ynoise)/2)-1,'NumTimePoints',round(length(ynoise)/2));
            [Y,~,~] =wvd(real(y),fs,'smoothedPseudo',kaiser(511,10),kaiser(511,10),'NumFrequencyPoints',round(length(ynoise)/2)-1,'NumTimePoints',round(length(ynoise)/2));
        else
             [YN,Fv,t] =wvd(real(ynoise),fs,'smoothedPseudo',kaiser(511,10),kaiser(511,10),'NumFrequencyPoints',round(length(ynoise)/2),'NumTimePoints',round(length(ynoise)/2)+1);
             [Y,~,~] =wvd(real(y),fs,'smoothedPseudo',kaiser(511,10),kaiser(511,10),'NumFrequencyPoints',round(length(ynoise)/2),'NumTimePoints',round(length(ynoise)/2)+1);
        end
    case 5
        [imf,residual,info] = emd(real(ynoise));
        [YN,Fv,t]=hht(imf,fs,'FrequencyLimits',[0 fs/2]);
        [imf,residual,info] = emd(real(y));
        [Y,~,~]=hht(imf,fs,'FrequencyLimits',[0 fs/2]);
        YN=full(YN);
        Y=full(Y);
end
timek=toc;
tk=timek;