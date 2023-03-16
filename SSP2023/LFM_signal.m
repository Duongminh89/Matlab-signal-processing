function [t,y,SR]=LFM_signal(T,fv,fh,fd,fc,ti,t0,A);
%% description output and input
    %% input
        % T: Total Time
        % fv: Sample frequency
        % fh: Final frequency of LFM
        % fd: starting frequency of LFM
        % ti: pulse width of LFM signal
        % t0: TOA of LFM signal
    %% Output
        % y: LFM signal
        % t: time
 %% Start program
 
 %% calculate sample and out time
    dt= 1/fv;
    t=0:dt:T-dt;
 %% caculate frequency parameters
    
    df=(fh-fd);     % reference frequency
    SR=df/ti;       % chirp-rate
    tti=0:dt:ti-dt;
    F=SR*tti/2;
 %% Create LFM signal
    y1=A*exp(j*2*pi*fc.*tti).*exp(j*2*pi*F.*tti);
    y=zeros(1,length(t));
    y(fix(t0*fv)+1:fix(t0*fv)+length(y1))=y1;
    
    
    
    