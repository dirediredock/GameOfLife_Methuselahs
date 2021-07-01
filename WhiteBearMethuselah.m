
% by Matias I. Bofarull Oddo - June 29th 2021

close all; clear; clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

iterations=300;
sides=800;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
    A=zeros(5,5);
    
    A(2:3,2)=1;
    A(3:4,3)=1;
    A(2:3,4)=1;

    figure('Position',[120,60,1420,780],'Color','k'); hold on;
    imagesc(A); shading flat; colormap(gray);
    axis equal; axis off;
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Main=zeros(sides,sides);

    Main(2+(sides/2):3+(sides/2),2+(sides/2))=1;
    Main(3+(sides/2):4+(sides/2),3+(sides/2))=1;
    Main(2+(sides/2):3+(sides/2),4+(sides/2))=1;

WhiteBear=Main;

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
    
    [Y,X]=find(WhiteBear);
    scatter(X,Y,40,'c','filled');
    
    xlim([nanmin(cloud(:,1))-1,nanmax(cloud(:,1))+1]);
    ylim([nanmin(cloud(:,2))-1,nanmax(cloud(:,2))+1]);
    
    set(gcf,'Color','k'); drawnow; clf;
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%















