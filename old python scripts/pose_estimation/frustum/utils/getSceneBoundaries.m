function [ minX,maxX,minY, maxY ] = getSceneBoundaries( frames,c )
%GETSPACEBOUNDARIES Get minX,maxX,minY and maxY for a given set of persons
%position (used in visualization)

minX=inf; maxX=-inf;
minY=inf; maxY=-inf;
for i=1:numel(frames)
    pos=frames{i};
    if minX>min(pos(:,2))
        minX=min(pos(:,2));
    end
    if maxX<max(pos(:,2))
        maxX=max(pos(:,2));
    end
    if minY>min(pos(:,3))
        minY=min(pos(:,3));
    end
    if maxY<max(pos(:,3))
        maxY=max(pos(:,3));
    end    
end
minX=minX-c; maxX=maxX+c;
minY=minY-c; maxY=maxY+c;

end

