function plot_reldata(YN,Fv,t,ax,val)
p2=subplot(2,3,2,'parent',ax);
switch val
    case 1
       
        cla(p2,'reset');
        plot(p2,Fv/1e6,YN,'linewidth',1.5);
        grid(p2,'on');
        ylabel(p2,'Amplitude (V)');
        xlabel(p2,'Frequency (MHz)');
        title(p2,'Spectrum of  received signal');
        axis(p2,[0 max(Fv)/5e6 0 max(YN)]);
    case 2

        cla(p2,'reset')
       image(p2,"XData",t*1e6,"YData",Fv/1e6,"CData",abs(YN),"CDataMapping","scaled")
        
         xlabel(p2,'Time (\mus)')
        ylabel(p2,'Frequency (MHz)');
        title(p2,'Short-time Fourier transform (2D)')
         axis(p2,[0 max(t)*1e6 0 30])
        
     
     case 3

       cla(p2,'reset')
       mesh(p2,t*1e6,Fv/1e6,abs(YN));
       axis(p2,[0 max(t)*1e6 0 30])
        view(2)
     

         xlabel(p2,'Time (\mus)')
        ylabel(p2,'Frequency (MHz)');
        title(p2,'Wingner-Ville distribution ')
          axis(p2,'square');
    case 4

        cla(p2,'reset')
       mesh(p2,t*1e6,Fv/1e6,abs(YN));
%        axis(p2,[0 max(t)*1e6 0 20])
        view(2)
%         colorbar
         axis(p2,'square');
         xlabel(p2,'Time (\mus)')
        ylabel(p2,'Frequency (MHz)');
        title(p2,'Continuous Wavelet transform (2D)')
        axis(p2,[0 max(t)*1e6 0 30])
        
% shading(p2,'flat') ;
%          axis(p2,'ij')
    case 5
  
       mesh(p2,t*1e6,Fv/1e6,abs(YN));
       axis(p2,[0 max(t)*1e6 0 30])
        view(2)
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

p4=subplot(2,3,3,'parent',ax);
[BW,BWN]=fil_imag(YN,YN);
cla(p4,'reset');
image(p4,"XData",t*1e6,"YData",Fv/1e6,"CData",abs(BWN),"CDataMapping","scaled")
axis(p4,[0 max(t)*1e6 0 30])
 xlabel(p4,'Time (\mus)');
 ylabel(p4,'Frequency (MHz)')
  title(p4,'Filtered data')
   view(2)
axis(p4,'square')
end
