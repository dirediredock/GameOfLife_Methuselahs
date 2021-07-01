
% by Matias I. Bofarull Oddo - June 27th 2021

close all; clear; clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

iterations=2000;
sides=800;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
    Acorn=zeros(5,9);

    Acorn(2,3)=1;
    Acorn(3,5)=1;
    Acorn(4,2:3)=1;
    Acorn(4,6:8)=1;

    figure('Position',[120,60,1420,780],'Color','k'); hold on;
    imagesc(Acorn); shading flat; colormap(gray);
    [Y,X]=find(Acorn);
    scatter(X,Y,600,'c','filled');
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Main=zeros(sides,sides);

Main(2+(sides/2),3+(sides/2))=1;
Main(3+(sides/2),5+(sides/2))=1;
Main(4+(sides/2),2+(sides/2):3+(sides/2))=1;
Main(4+(sides/2),6+(sides/2):8+(sides/2))=1;

Acorn=Main;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('Position',[120,60,sides,sides]); hold off;

for i=1:iterations
    
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
    
    %     scatter(cloud(:,1),cloud(:,2),30,cloud(:,3),'filled');
    %     colormap(viridis); hold on
    
    imagesc(logsum); shading flat; colormap(inferno);
    axis equal; axis off; hold on;
    
    [Y,X]=find(Acorn);
    scatter(X,Y,40,'c','filled');
    
    xlim([nanmin(cloud(:,1))-1,nanmax(cloud(:,1))+1]);
    ylim([nanmin(cloud(:,2))-1,nanmax(cloud(:,2))+1]);
    
    set(gcf,'Color','k'); drawnow; clf;
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%















