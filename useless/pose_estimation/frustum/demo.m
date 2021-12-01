% Sebastiano Vascon      Version 1.00
% Copyright 2014 Sebastiano Vascon.  [sebastiano.vascon-at-iit.it]
% Please email me if you have questions.
%
% Please cite this work
% [1] S. Vascon, E. Zemene , M. Cristani, H. Hung, M.Pelillo and V. Murino
% A Game-Theoretic Probabilistic Approach for Detecting Conversational Groups
% ACCV 2014

% -------------------------------------------- %
%              Detect Groups in Multiple Frame %
% -------------------------------------------- %

close all
clear all
clc

addpath(genpath('./'));

% -------------------------------------------- %
%                         Algorithm parameters %
% -------------------------------------------- %
param.datasetDir='data/CocktailParty/';     %dataset directory
param.seqSubDir='';                         %if a subsequence exists write the name here (e.g. Seq1,Seq2 for CoffeeBreak)

param.evalMethod='card';                    %card require that 2/3 of the individals are correctly matched in a group

%multi/single frame
param.numFrames=1;                          %number of frames to analyze (>1 imply multiframe analysis)

%error to be injected in the data
param.error.percFrame=0;                    %percentage of corrupted frames
param.error.percPersons=0;                  %percentage of person corrupted on each currupted frame
param.error.noiseAmount=0;                  %amount of noise to be added [0,2pi]

%parameter for the 2D histogram
param.hist.n_x=20;                          %number of rows
param.hist.n_y=20;                          %number of columns

%displaying options
param.show.weights=0;                       %show the weight used to condense the similarity matrices
param.show.groups=1;                        %show a figure with the current frame, the detection and the groundtruth
param.show.frustum=0;                       %show the frustum
param.show.results=1;                       %display the precision/recall/F1-score values

%storing the results
param.output.filename='detections.mat';     %where to save the results

% -------------------------------------------- %
%                                         Main %
% -------------------------------------------- %

run([param.datasetDir '/dsetParameter.m']);   %load dataset parameters (frustum etc..)
param.datasetDir=[param.datasetDir param.seqSubDir];

fprintf('Load the persons positions and groundtruth \n');
load([param.datasetDir '/features.mat'],'features','timestamp');
load([param.datasetDir '/groundtruth.mat'],'GTgroups','GTtimestamp');

[~,indFeat] = intersect(timestamp,int64(GTtimestamp));
timestamp = timestamp(indFeat);
features  = features(indFeat); %evaluate only the frames that have the groundtruth

detections=[];  %detections
precisions=[];  
recalls=[];
TPs=[]; 
FPs=[];
FNs=[];

%get the boundaries of the scene (min and max for x and y)
param.sceneBound=zeros(1,4);
[param.sceneBound(1),param.sceneBound(2),param.sceneBound(3),param.sceneBound(4)]=getSceneBoundaries(features,param.frustum.length*4); 

for f=1:numel(features)-param.numFrames+1
    if ~isempty(features{f})
        
        feat=features(f:f+param.numFrames-1);                   %copy the frames
        
        fprintf(['******* Frames ' num2str(f:f+param.numFrames-1) ' *******\n']);
        [feat, fid]=injectNoise(feat,param.error);              %add noise
        
        [groups, frustums,weights]=detectGroups(feat,param);    %detect groups

        if param.show.groups>0
            fr=f+param.numFrames-1; %frame used as reference for the evaluation
            displayGroups({feat{end}},{groups},{GTgroups{fr}},0.5,param,param.show.groups);
        end        
        
        if param.show.weights>0 
            %display the weights
            figure(param.show.weights);
            bar(weights);
            title(['Weights used in Eq 8. corrupted frames ={' num2str(sort(fid)) '}']);
        end
        
        detections=[detections ; {groups}];
        
        [p,r,tp,fp,fn] = evalgroups(groups,GTgroups(:,f+param.numFrames-1),param.evalMethod);
        
        %add the evaluation results to the queue
        precisions=[precisions ; p'];
        recalls=[recalls ; r'];
        TPs=[TPs ; tp'];
        FPs=[FPs ; fp'];
        FNs=[FNs ; fn'];
        
        if param.show.results>0
            showResults(precisions,recalls);
        end
        
        save(param.output.filename,'detections','precisions','recalls');
        
    else
        fprintf(['******* Frame ' num2str(f) ' is empty *******\n']);
    end
    
end

% variable 'detections' contains the grouping results, now show the data to see quanlitative the results
fprintf('Show again the results of the detections using displayGroups\n');
fps=0.1;  %set the pause in seconds between a plot to another
displayGroups(features(param.numFrames:end),detections,GTgroups,fps,param,param.show.groups);
