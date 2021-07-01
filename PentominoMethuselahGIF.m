
close all; clear; clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

iterations=1000;
sides=800;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
    rPentomino=zeros(5,5);

    rPentomino(2:4,3)=1;
    rPentomino(3,2)=1;
    rPentomino(2,4)=1;

    figure('Position',[120,60,1420,780],'Color','k'); hold on;
    imagesc(rPentomino); shading flat; colormap(gray);
    axis equal; axis off;
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Main=zeros(sides,sides);

    Main(2+(sides/2):4+(sides/2),3+(sides/2))=1;
    Main(3+(sides/2),2+(sides/2))=1;
    Main(2+(sides/2),4+(sides/2))=1;

rPentomino=Main;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

nImages=iterations;

fig=figure('Position',[120,60,sides/4,sides/4]);

for idx=1:nImages
    
    for i=idx
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% START OF IMAGE PLOTTING
        
    
        
        neighbours=conv2(Main,[1 1 1; 1 0 1; 1 1 1], 'same');
        Main=double((Main & neighbours==2) | neighbours==3);
        
        disp(i);
        
        if i==1
            sum=Main;
        else
            sum=rescale(sum);
            sum=sum+Main;
        end
        
        logsum=log(sum);
        
        [height,width]=size(logsum);
        [x,y]=meshgrid(1:width,1:height);
        cloud=[x(:),y(:),logsum(:)];
        
        cloud(cloud==-Inf)=NaN;
        cloud(any(isnan(cloud),2),:)=[];
        
%       scatter(cloud(:,1),cloud(:,2),30,cloud(:,3),'filled');
%       colormap(viridis); hold on
        
        imagesc(logsum); shading flat; colormap(inferno);
        axis equal; axis off; hold on;
        
        [Y,X]=find(rPentomino);
        scatter(X,Y,10,'c','filled');
        
        xlim([nanmin(cloud(:,1))-1,nanmax(cloud(:,1))+1]);
        ylim([nanmin(cloud(:,2))-1,nanmax(cloud(:,2))+1]);
        
        set(gcf,'Color','k');
        
        
        
        
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% END OF IMAGE PLOTTING
        
    end
    
    drawnow
    
    frame=getframe(fig);
    im{idx}=frame2im(frame);
    
    clf;
    clf(fig,'reset');
end

close;

filename='ThePentominoMethuselahSmall.gif';

for GIFidx=1:nImages
    
    [A,map]=rgb2ind(im{GIFidx},256);
    
    if GIFidx==1
        imwrite(A,map,filename,'gif','LoopCount',Inf, ...
            'DelayTime',0.09);
    else
        imwrite(A,map,filename,'gif','WriteMode','append', ...
            'DelayTime',0.09);
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

















