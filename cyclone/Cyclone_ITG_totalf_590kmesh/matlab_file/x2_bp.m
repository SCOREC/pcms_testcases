function x2_bp(fnum,pnum,name)
% function x2_bp(fnum,pnum,name)
    % set size of interpolation
    sz=400;
    % get file names
    meshfile ='xgc.mesh.bp';
    pfile = ['xgc.3d.' , sprintf('%5.5d',fnum) , '.bp']

    % read 
     %rz=adiosread(meshfile,'/coordinates/values');
    rz=adiosread(meshfile,'rz');
    pot=adiosread(pfile,name);
    if(pnum==0)
      var=pot(:);
    else
      var=pot(pnum,:);
    end
    %prepare rz rect. grid
    x=rz(1,:)'; y=rz(2,:)';
    xlin=linspace(min(x),max(x),sz) ;ylin=linspace(min(y),max(y),sz) ;[X,Y]=meshgrid(xlin,ylin);
    
    VAR=griddata(x,y,var,X,Y,'linear'); 
    a=imagesc(xlin,ylin,VAR);colorbar; colormap(jet); axis('equal')
    set(gca,'YDir','normal');
    disp(max(var, [], 2))
    disp(min(var, [], 2))
    image = getframe(gcf);
    imwrite(image.cdata, 'test.png')    
    %print -r1500
    %saveas((figure(1), 'test.png')
end