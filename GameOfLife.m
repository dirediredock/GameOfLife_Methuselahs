
% Matias I. Bofarull Oddo - June 13th 2021

close all; clear; clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

iterations=800;
sides=800;
sparseness=8;

m=zeros(sides,sides);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

m(sides/5:(sides/4+sides/5)-1,sides/5:(sides/4+sides/5)-1) ...
    =randi(sparseness,sides/4)-1;
m(sides/5:(sides/4+sides/5)-1,sides+1-(sides/4+sides/5):sides-sides/5) ...
    =randi(sparseness,sides/4)-1;
m(sides+1-(sides/4+sides/5):sides-sides/5,sides/5:(sides/4+sides/5)-1) ...
    =randi(sparseness,sides/4)-1;
m(sides+1-(sides/4+sides/5):sides-sides/5,sides+1-(sides/4+sides/5):sides-sides/5) ...
    =randi(sparseness,sides/4)-1;
m(m<sparseness-1)=0;m(m==sparseness-1)=1;

for i=1:iterations
    
    disp(i);
    
    neighbours=conv2(m,[1 1 1; 1 0 1; 1 1 1], 'same');
    m=double((m & neighbours==2) | neighbours==3);
    
    if i==1
        sum=m;
    else
        sum=rescale(sum);
        sum=sum+m;
    end
    
    logsum=log(sum);
    
    fig=figure('Position',[10,10,sides,sides],'Resize','off','Color','k');
    set(subtightplot(1,1,1),'Position',[0.05, 0.05, 0.89, 0.89]); hold on;
    
    pcolor(logsum); shading flat; colormap(inferno); 
    points=m;
    [y,x]=find(m);
    scatter(x,y,0.5);
    axis off; axis equal; drawnow;
    
%     frame=getframe(fig);
%     im{1}=frame2im(frame);[A,map]=rgb2ind(im{1},256);
%     imwrite(A,map,['Life',num2str(i,'%05.f'),'.png'],'png');

    close all
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%














