function output=verify_data(label,nplanes,indexes)
%c
%units
%dt3d=sml_dt;
dt3d=3.9144167E-7;
t=indexes*dt3d;
%t=adiosread('xgc.oneddiag.bp','time');
i_parallel_flow_1d=adiosread('xgc.oneddiag.bp','i_parallel_flow_1d');
i_radial_flux_1d=adiosread('xgc.oneddiag.bp','i_radial_flux_1d');

time=indexes*dt3d;
fdata=zeros(nplanes,numel(indexes));
for ifnum=1:numel(indexes)
    fnum=indexes(ifnum)
    pfile = ['xgc.3d.' , sprintf('%5.5d',fnum) , '.bp']
    data=adiosread(pfile,label);
    for i=1:nplanes
      fdata(i,ifnum)=sqrt(mean(data(i,:).^2));
    end
end
h=mean(fdata,1);
figure;plot(fdata');hold on;plot(mean(fdata,1),'k','linewidth',4)
nn=numel(h);
delta=(log(h(2))-log(h(1)))/dt3d;
gamma=(log(h(2:nn))-log(h(1:nn-1)))./(dt3d*(indexes(2:end)-indexes(1:end-1)));
figure;
% %subplot(3,1,1)
 plot(time(1:nn-1)*1000,gamma/1000);xlabel('time [ms]');ylabel('\gamma [kHz]');
% gamma_mean=mean(gamma(floor(nn/1.5):nn-1))
% hold on;plot(1000*[time(floor(nn/1.5)),time(nn-1)],gamma_mean*[1,1]/1000,'r--')
% if(gamma_mean>0)
% ylim(1.5*gamma_mean*[0,1]/1000);
% else
% 
% end
% box on;
% grid on;
% subplot(3,1,2);plot(t*1000,sum(i_parallel_flow_1d,1));grid on;box on;xlabel('t [ms]');ylabel('paralle flow')
% subplot(3,1,3);plot(t*1000,sum(i_radial_flux_1d,1));grid on;box on;xlabel('t [ms]');ylabel('radial flux')
% 
% output.time=time(1:nn-1)*1000;
% output.gamma=gamma/1000;
fileID = fopen('dpot_gamma.txt','w');
fprintf(fileID,'%6s %12s %12s\n','time','dpot_gamma', 'dpot');
fprintf(fileID,'%12.8e %12.8e \n',time(1:nn-3),gamma(1:nn-3),h(1:nn-3));
disp(nn-1)
fclose(fileID);
%disp(gamma(1:190))