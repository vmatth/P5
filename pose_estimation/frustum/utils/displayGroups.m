function displayGroups( frames, groups, GTgroups,fps,param,h)
%SHOWGROUPS Display the grouping results

if nargin<6 || h==0
    h=figure();
end

if ~isfield(param,'sceneBound')
    param.sceneBound=zeros(1,4);
    [param.sceneBound(1),param.sceneBound(2),param.sceneBound(3),param.sceneBound(4)]=getSceneBoundaries(frames,param.frustum.length*3);
end

deltaRect1=5; deltaRect2=20; LineWidth=2; textDisplacement=3;

figure(h);
axis([param.sceneBound(1),param.sceneBound(2),param.sceneBound(3),param.sceneBound(4)]);

for i=1:min(numel(frames),numel(groups))
    hD=0; hG=0;
    
    pos=frames{i};
    
    cols=colormap(hsv(3+size(pos,1)));
    cols=cols(3:end,:);
    
    %scatter(pos(:,2),pos(:,3),'o');
    %hold on;
    if param.show.frustum>0
        for ind=1:size(pos,1)
            f=frustumModel([pos(ind,2),pos(ind,3)],pos(ind,4),param.frustum.length,param.frustum.aperture,param.frustum.samples);
            scatter(f(:,1),f(:,2),3,cols(ind,:));
            axis([param.sceneBound(1),param.sceneBound(2),param.sceneBound(3),param.sceneBound(4)]);
    
            hold on;
        end
    else
        l=ones(size(pos,1),1)*param.frustum.length;
        quiver(pos(:,2),pos(:,3),l.*cos(pos(:,4)),l.*sin(pos(:,4)));
    end
    hold on;
    axis([param.sceneBound(1),param.sceneBound(2),param.sceneBound(3),param.sceneBound(4)]);
    hold on;
    
    %draw detection (red)
    X=[]; Y=[];
    figure(h);
    if ~isempty(groups)
        d=groups{i};
        for g=1:numel(d)
            [id]=find(ismember(pos(:,1),d{g})==1);
            X=[X ; pos(id,2) ; pos(id,2)+deltaRect1; pos(id,2)+deltaRect1; pos(id,2)-deltaRect1 ; pos(id,2)-deltaRect1];
            Y=[Y ; pos(id,3) ; pos(id,3)+deltaRect1; pos(id,3)-deltaRect1; pos(id,3)+deltaRect1; pos(id,3)-deltaRect1];

            k = convhull(X',Y');
            %patch(X(k),Y(k),col,'LineWidth',3,'LineStyle','-.');
            hD=plot(X(k),Y(k),'Color',[1 0 0],'LineWidth',LineWidth,'LineStyle','-.');
            hold on;
            axis([param.sceneBound(1),param.sceneBound(2),param.sceneBound(3),param.sceneBound(4)]);
            hold on;
            X=[]; Y=[]; 
        end
    end
    
    if ~isempty(GTgroups)
        gt=GTgroups{i};
        %draw the ground truth (yellow)
        X=[]; Y=[];
        for g=1:numel(gt)
            [id]=find(ismember(pos(:,1),gt{g})==1); 
            X=[X ; pos(id,2) ; pos(id,2)+deltaRect2; pos(id,2)+deltaRect2; pos(id,2)-deltaRect2; pos(id,2)-deltaRect2];
            Y=[Y ; pos(id,3) ; pos(id,3)+deltaRect2; pos(id,3)-deltaRect2; pos(id,3)+deltaRect2; pos(id,3)-deltaRect2];
            k = convhull(X',Y');
            %patch(X(k),Y(k),col,'LineWidth',3,'LineStyle','-.');
            hG=plot(X(k),Y(k),'Color',[0 1 0],'LineWidth',LineWidth,'LineStyle','-');
            hold on;
            axis([param.sceneBound(1),param.sceneBound(2),param.sceneBound(3),param.sceneBound(4)]);
            hold on;
            X=[]; Y=[]; 
        end
    end
    
    scatter(pos(:,2),pos(:,3),100,'fill');
    hold on;
    %display the persons id
    for pid=1:size(pos,1)
        if param.show.frustum>0
            text(pos(pid,2)-textDisplacement,pos(pid,3)-textDisplacement,{num2str(pos(pid,1))},'FontSize',10,'BackgroundColor',[1 1 1]);
        else
            text(pos(pid,2)-textDisplacement,pos(pid,3)-textDisplacement,{num2str(pos(pid,1))},'FontSize',10);
        end
        hold on;
    end
    
    if hD~=0 && hG~=0
        legend([hD hG],{'Detection','Groundtruth'},'Location','South','Orientation','Horizontal');
    elseif hD==0 && hG~=0
        legend([hG],{'Groundtruth'},'Location','South','Orientation','Horizontal');
    elseif hD~=0 && hG==0
        legend([hD],{'Detection'},'Location','South','Orientation','Horizontal');        
    else
        
    end
    axis([param.sceneBound(1),param.sceneBound(2),param.sceneBound(3),param.sceneBound(4)]);
    hold off;
    pause(fps);
end

end

