Sebastiano Vascon      Version 1.00
Copyright 2014 Sebastiano Vascon.  [sebastiano.vascon-at-iit.it]
Please email me if you have questions.

S. Vascon, E. Zemene , M. Cristani, H. Hung, M.Pelillo and V. Murino
A Game-Theoretic Probabilistic Approach for Detecting Conversational Groups
ACCV 2014

======================= DEMO ==========================

The demo execute the conversational groups detector on 2 datasets (CocktailParty and Synth). 
You have to choose which one you want to see by setting the variable param.datasetDir='data/CocktailParty/'; (line 23);

=======================================================

==================== BASIC USAGE ======================

The core of the package is on the method "detectGroups(frames,param)" which detect conversational groups in multiple frames. 

The data and required parameters should be provided in the following format:

   frames     := a 1xm vector of cells containing on each cell a matrix of
                 persons positions. Each matrix is of size nx4 having on each row: 
                | Person ID | Pos X | Pos Y | Orientation (radiants) |
 
   param      := a struct containing the following parameters. If not
                 specified a default set of parameters will be used.
 
                 Frustum parameters:
                    - param.frustum.length=20;      lenght of the frustum
                    - param.frustum.aperture=160;   aperture in degree
                    - param.frustum.samples=2000;   number of samples
                 Histogram paramters
                    - param.hist.n_x=20;            number of bin per rows
                    - param.hist.n_y=20;            number of bin per cols    
                 Affinity matrix parameter
                    - param.sigma=0.2;              normalizing factor 
                    - param.method='JS';            type of distance (JS or KL)
 
  OUTPUT:
  =======
   groups     := vector of cells in which each cell represents a group 
                 containing the Persons ID 
 
   frustums   := a list of cells containing the generated frustum per each
                 persons and the corresponding 2D histogram
 
   weights    := the average of the weights that the MCLP optimizer has 
                 assigned to each frame
 
 
  EXAMPLE:
  =======
    In SingleFrameExample.m you can see a basic setup for a single frame detection
    In MultiFrameExample.m you can see a basic setup for a multiframe detection