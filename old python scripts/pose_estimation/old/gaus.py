
import math
import numpy as np

def frustumModel( pos,orj,length,aperture,samples):
# % FRUSTUMMODEL generate samples distributed on the field of view
# % 
# % INPUT:
# % ======
# %   pos         :=  position of a person [x,y]
# %
# %   orj         :=  head orientation between 0 and 2*pi
# %
# %   length      :=  length of the field of view
# %
# %   aperture    :=  aperture of the field of view in degree, for human 
# %                   is 160 (default 160).
# %
# %   samples     :=  number of samples to generate (default 2000)
# % 
# % OUTPUT:
# % =======
# %	ptsFM       :=  the samples of the frustum
# %
# %
# % EXAMPLE:
# % =======
# %   Generate a frustum of 5000 points for a person in x=0 , y=0 with head
# %   orientation of pi/2 (90 degree) with a length of view equal to 60 and
# %   an aperture of 160 degree.
# %
# %   figure; fpts=frustumModel([0,0],pi/2,60,160,5000); scatter(fpts(:,1),fpts(:,2));
# %   figure; fpts=frustumModel([0,0],pi/2,60,160,5000); surf(hist2D(fpts(:,1),fpts(:,2),20,20)); shading interp;
# %
# % -------------------------------------------------------------------------
# % Sebastiano Vascon      Version 1.00
# % Copyright 2014 Sebastiano Vascon.  [sebastiano.vascon-at-iit.it]
# % Please email me if you have questions.
# %
# % Please cite this work
# % [1] S. Vascon, E. Zemene , M. Cristani, H. Hung, M.Pelillo and V. Murino
# % A Game-Theoretic Probabilistic Approach for Detecting Conversational Groups
# % ACCV 2014

if nargin<5:
    samples=2000

if nargin<4:
    aperture=160

pts=[]
        
ptsFM=[]
        
if length>0:
    orjX=math.cos(orj)*length
    orjY=math.sin(orj)*length

#convert orj in deg
orj=360*orj/(2*math.pi)

# remove the point not in the frustum
while size(ptsFM,1)<samples:
    pts=[]
    for i=1:size(pos,2):
        pts=[pts , normrnd(0,length,samples,1)]
    end
    if ~isempty(pts)
        for i=1:size(pts,1)

            pt=pts(i,:);

            dot=sum(pt.*[orjX orjY]);
            L=sqrt(sum(pt.^2));

            ang=acos(dot/(L*length))/(2*pi)*360;% compute the angle between the point and the orientation

            if ang<=(aperture/2) && size(ptsFM,1)<samples
                %the point is inside the cone
                ptsFM=[ptsFM ; pts(i,:)+pos];
            end
        end
    end

end
else
    ptsFM=repmat(pos,samples,1);
end
end