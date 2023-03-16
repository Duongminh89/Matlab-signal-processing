function plot_time(y,ynoise,t,ax)
p1=subplot(2,3,1,'parent',ax);
cla(p1,'reset');
plot(p1,t*1e6,real(y),'linewidth',1.5);
xlabel(p1,'Time (\mus)');
ylabel(p1,'Amplitude (V)');
grid(p1,'on');
title(p1,'Signal without noise');
axis(p1,[0 max(t)*1e6 -max(real(y))-1 max(real(y))+1]);
p2=subplot(2,3,4,'parent',ax);
cla(p2,'reset');
plot(p2,t*1e6,real(ynoise),'linewidth',1.5);
xlabel(p2,'Time (\mus)');
ylabel(p2,'Amplitude (V)');
grid(p2,'on');
title(p2,'Signal with noise');
axis(p2,[0 max(t)*1e6 -max(abs(ynoise))-1 max(abs(ynoise))+1.]);
