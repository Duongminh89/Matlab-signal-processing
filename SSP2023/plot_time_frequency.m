function plot_time_frequency(Y,YN,Fv,t,ax,val);
p1=subplot(2,3,2,'parent',ax);
p2=subplot(2,3,5,'parent',ax);
switch val
    case 1
        cla(p1,'reset')
        plot(p1,Fv/1e6,Y,'linewidth',1.5);
        grid(p1,'on');
        ylabel(p1,'Amplitude (V)');
        xlabel(p1,'Frequency (MHz)');
        title(p1,'Spectrum of  transmitted signal');
        axis(p1,[0 max(Fv)/5e6 0 max(Y)]);
        cla(p2,'reset');
        plot(p2,Fv/1e6,YN,'linewidth',1.5);
        grid(p2,'on');
        ylabel(p2,'Amplitude (V)');
        xlabel(p2,'Frequency (MHz)');
        title(p2,'Spectrum of  received signal');
        axis(p2,[0 max(Fv)/5e6 0 max(YN)]);
    case 2
        cla(p1,'reset');
       image(p1,"XData",t*1e6,"YData",Fv/1e6,"CData",abs(Y),"CDataMapping","scaled")
        axis(p1,[0 max(t)*1e6 0 30])
         
        colorbar;
        xlabel(p1,'Time (\mus)')
        ylabel(p1,'Frequency (MHz)');
        title(p1,'Short-time Fourier transform (3D)')
        zlabel(p1,'Amplitude (dB)')
        cla(p2,'reset')
       image(p2,"XData",t*1e6,"YData",Fv/1e6,"CData",abs(YN),"CDataMapping","scaled")
        
         xlabel(p2,'Time (\mus)')
        ylabel(p2,'Frequency (MHz)');
        title(p2,'Short-time Fourier transform (2D)')
         axis(p2,[0 max(t)*1e6 0 30])
        
  
     
     case 3
        cla(p1,'reset');
        image(p1,"XData",t*1e6,"YData",Fv/1e6,"CData",abs(Y),"CDataMapping","scaled")
        axis(p1,[0 max(t)*1e6 0 30])
        
        xlabel(p1,'Time (\mus)')
        ylabel(p1,'Frequency (MHz)');
        title(p1,'Wingner-Ville distribution ')
        zlabel(p1,'Amplitude (dB)')
       cla(p2,'reset')
       mesh(p2,t*1e6,Fv/1e6,abs(YN));
       axis(p2,[0 max(t)*1e6 0 30])
        view(2)
     

         xlabel(p2,'Time (\mus)')
        ylabel(p2,'Frequency (MHz)');
        title(p2,'Wingner-Ville distribution ')
    case 4
        cla(p1,'reset');
        mesh(p1,t*1e6,Fv/1e6,abs(Y));
        view(p1,2)
        axis(p1,[0 max(t)*1e6 0 30]);
        xlabel(p1,'Time (\mus)')
        ylabel(p1,'Frequency (MHz)');
        title(p1,'Continuous Wavelet transform (2D)')
        zlabel(p1,'Amplitude (dB)')
        cla(p2,'reset')
       mesh(p2,t*1e6,Fv/1e6,abs(YN));
%        axis(p2,[0 max(t)*1e6 0 20])
        view(p2,2)
%         colorbar

         xlabel(p2,'Time (\mus)')
        ylabel(p2,'Frequency (MHz)');
        title(p2,'Continuous Wavelet transform (2D)')
        axis(p2,[0 max(t)*1e6 0 30])
%          axis(p2,'tight')
% shading(p2,'flat') ;
%          axis(p2,'ij')
    case 5
        cla(p1,'reset');
       mesh(p1,t*1e6,Fv/1e6,abs(Y));
       view(p1,2)
        axis(p1,[0 max(t)*1e6 0 30])
         
%         colorbar;
        xlabel(p1,'Time (\mus)')
        ylabel(p1,'Frequency (MHz)');
        title(p1,'Hilbert-hough transform (3D)')
        zlabel(p1,'Amplitude (dB)')
        cla(p2,'reset')
       mesh(p2,t*1e6,Fv/1e6,abs(YN));
       axis(p2,[0 max(t)*1e6 0 30])
        view(p2,2)
        colorbar;
         xlabel(p2,'Time (\mus)')
        ylabel(p2,'Frequency (MHz)');
        title(p2,'Hilbert-Hough transform (2D)')
        axis(p2,[0 max(t)*1e6 0 30])
%          axis(p2,'tight')
% shading(p2,'flat') ;
%          axis(p2,'ij')

end
if val~=1
p3=subplot(2,3,3,'parent',ax);
p4=subplot(2,3,6,'parent',ax);
[BW,BWN]=fil_imag(YN,Y);
 cla(p3,'reset');
 mesh(p3,t*1e6,Fv/1e6,abs(BW));
 view(p3,2)
  axis(p3,[0 max(t)*1e6 0 30])
  title(p3,'Filtered data')
 xlabel(p3,'Time (\mus)');
 ylabel(p3,'Frequency (MHz)')
 
  cla(p4,'reset');
mesh(p4,t*1e6,Fv/1e6,abs(BWN));
view(p4,2)
   axis(p4,[0 max(t)*1e6 0 30])
 xlabel(p4,'Time (\mus)');
 ylabel(p4,'Frequency (MHz)')
  title(p4,'Filtered data')
   
end

