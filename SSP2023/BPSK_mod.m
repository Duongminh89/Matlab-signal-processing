function [brkseq,y,tt] = BPSK_mod(barker,fc,fb,fs,A,Tmax)
%% Function to modulate an incoming binary stream using BPSK(baseband)
    %barker - Type of barker
    %fc - carry frequency
    %L - oversampling factor (Tb/Ts) 1/Tb is bit rate
    %fs - sampling frequency
    %y - BPSK modulated signal(baseband)
    %t - generated time base for the modulated signal
%% simulation 
    dt=1/(fs);
    t=0:dt:1/fb-dt;
    tt=0:dt:Tmax-dt;
    N=length(tt);
    brk=[];
    if barker==13
        pw=round(length(t)/13);
        brk = [ones(1,pw*5),-(ones(1,pw*2)),ones(1,pw*2),-ones(1,pw),ones(1,pw),-ones(1,pw),ones(1,pw)];%13 bit
    elseif barker==11
        pw=round(length(t)/11);
        brk = [ones(1,pw*3),-(ones(1,pw*3)),ones(1,pw),-ones(1,pw),-ones(1,pw),ones(1,pw),-ones(1,pw)];% 11 bit
    elseif barker==7
        pw=fix(length(t)/7);
        brk = [ones(1,pw*3),-(ones(1,pw*2)),ones(1,pw),-ones(1,pw)];% 7 bits
    else
        pw=fix(length(t)/5);
        brk = [ones(1,pw*3),-(ones(1,pw)),ones(1,pw)];% 5 bits
    end
%% generate BPSK with carry frequency
carrier=exp(j*(2*pi*fc*t));
y1=A*brk.*carrier;
brkseq=zeros(1,N);
brkseq(1:length(brk))=brk;
y=zeros(1,N);
y(1:length(y1))=y1;

   