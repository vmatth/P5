function [groups,px,weights]=detectGroups(frames,param)
% DETECTGROUPS Detect conversational groups given a set of frames each one 
% containing the positions, the head orientation and the IDs of the 
% individuals in the scene.
%
% The last frame is the reference frame because the method used the past
% information to smooth the actual values. For this reason the further 
% evaluation should be made on it.
% 
% INPUT:
% ======
%  frames     := a 1xm vector of cells containing on each cell a matrix of
%                persons. Each matrix is of size nx4 having on each row: 
%               | Person ID | Pos X | Pos Y | Orientation (radiants) |
%
%  param      := a struct containing the following parameters. If not
%                specified a default set of parameters will be used.
%
%                Frustum parameters:
%                   - param.frustum.length=20;      lenght of the frustum
%                   - param.frustum.aperture=160;   aperture in degree
%                   - param.frustum.samples=2000;   number of samples
%                Histogram paramters
%                   - param.hist.n_x=20;            number of bin per rows
%                   - param.hist.n_y=20;            number of bin per cols    
%                Affinity matrix parameter
%                   - param.sigma=0.2;              normalizing factor 
%                   - param.method='JS';            type of distance (JS or
%                                                   KL)
%
% OUTPUT:
% =======
%  groups     := vector of cells in which each cell represents a group 
%                containing the Persons ID 
%
%  frustums   := a list of cells containing the generated frustum per each
%                persons and the corresponding 2D histogram
%
%  weights    := the average of the weights that the MCLP optimizer has 
%                assigned to each frame
%
%
% EXAMPLE:
% =======
%  frames=[];
%  frame_t1=[1 , 100, 100 , pi; 2 , 120, 120 , pi/2; 3 , 90, 90 , pi/4]; 
%  frames=[frames , {frame_t1}];
%  frame_t2=[1 , 110, 110 , pi; 2 , 125, 125 , pi/2; 3 , 100, 100 , pi/4]; 
%  frames=[frames , {frame_t2}];
%  frame_t3=[1 , 105, 110 , pi; 2 , 130, 125 , pi/2; 3 , 105, 95 , pi/4]; 
%  frames=[frames , {frame_t3}];
%  [groups, frustums,weights]= detectGroups(frames);
% 
%
% -------------------------------------------------------------------------
% Sebastiano Vascon      Version 1.00
% Copyright 2014 Sebastiano Vascon.  [sebastiano.vascon-at-iit.it]
% Please email me if you have questions.
%
% Please cite this work
% [1] S. Vascon, E. Zemene , M. Cristani, H. Hung, M.Pelillo and V. Murino
% A Game-Theoretic Probabilistic Approach for Detecting Conversational Groups
% ACCV 2014
% -------------------------------------------------------------------------

if nargin<2
    %frustum
    param.frustum.length=50;
    param.frustum.aperture=160;
    param.frustum.samples=2000;

    % histogram binning
    param.hist.n_x=20;
    param.hist.n_y=20;

    % affinity matrix parameter
    param.sigma=0.4;
    param.method='JS';
end

%find the set of IDs on all the frames and zero pad for the ones that
%are not in the list.
IDs=[];
for f=1:numel(frames)
    frame=frames{f};
    [IDs]=[IDs ; frame(:,1)];
    frame=sortrows(frame,1); %sort the ID the ensure consistency when zero 
                             %pad is added to the final matrix
    frames{f}=frame;
end
IDs=unique(IDs);    %find the unique ID
IDs=sort(IDs);      %sort the IDs for later use

%generate a similarity matrix for each frame leaving the space for the
%frame in which persons are not present.
As=[];
for f=1:numel(frames)

    persons=frames{f};
    
    % generate a frustum for each person
    minX=inf;
    minY=inf;
    maxX=-inf;
    maxY=-inf;

    px={};
    for i=1:size(persons,1)
        px{i}.frustum=frustumModel([persons(i,2),persons(i,3)],persons(i,4),param.frustum.length,param.frustum.aperture,param.frustum.samples);

        %evaluate space boundaries for the histogram
        if minX>min(px{i}.frustum(:,1)) 
            minX=min(px{i}.frustum(:,1));
        end
        if minY>min(px{i}.frustum(:,2)) 
            minY=min(px{i}.frustum(:,2));
        end
        if maxX<max(px{i}.frustum(:,1)) 
            maxX=max(px{i}.frustum(:,1));
        end
        if maxY<max(px{i}.frustum(:,2)) 
            maxY=max(px{i}.frustum(:,2));
        end

    end

    %generate 2D histogram for each person and on the entire space
    for i=1:size(persons,1)
        px{i}.hist2D=hist2D(px{i}.frustum(:,1),px{i}.frustum(:,2),param.hist.n_x,param.hist.n_y,[minX,maxX],[minY,maxY]); %get the 2D histogram
        px{i}.hist=reshape(px{i}.hist2D,1,param.hist.n_x*param.hist.n_y); %create a row vector of the histogram
    end

    %evaluate pairwise affinity matrix    
    if numel(px)>1
        A=zeros(numel(px),numel(px));
        if strcmp(param.method,'JS')==1
            for i=1:numel(px)
                for j=i+1:numel(px)
                    A(i,j)=JSDiv(px{i}.hist,px{j}.hist);
                    A(j,i)=A(i,j);
                end
            end
        elseif strcmp(param.method,'KL')==1
            for i=1:numel(px)
                for j=1:numel(px)
                    if i~=j
                        A(i,j)=KLDiv(px{i}.hist,px{j}.hist);
                    end
                end
            end    
        else
            fprintf('Unrecognized distance function (use JS or KL)\n');
        end

        A=exp(-A./param.sigma).*not(eye(size(A)));
    else
        A=0;
    end
    
    %zero padding the matrix so all the matrices have the same size
    if size(A,1)<numel(IDs)
        %find the row and cols to pad
        ind=find(ismember(IDs,persons(:,1))==0);
        A=zeropadding(A,ind);
    end
    As=[As ; {A}];
end

if numel(As)>1
    %if the number of frames is greater than one we are working in a
    %multiframe setting and thus we have to compute the weight to mix 
    %the affinity matrices
    
    %find the weights using MCLP
    weights=calculateMCLPWeights(As); 
    A=zeros(size(As{1}));
    for i=1:numel(As)
        A=A+weights(i).*As{i};
    end
else
    A=As{1};
    weights=1;
end


% extract groups using dominant set library
d=DSF('RD',3000,1e-5,0);
d.globalContext=1;
theta=0.00001;

d=d.setSimilarityMatrix(A);
d=d.clusterize(theta);
d=d.setDataset(IDs);
d=d.getDataCluster();
        
% get groups
groups=[];
for i=1:size(d.clusters,2)
    groups{i}=d.clusters(i).elements';
end

end