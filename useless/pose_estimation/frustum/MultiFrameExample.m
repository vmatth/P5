% Sebastiano Vascon      Version 1.00
% Copyright 2014 Sebastiano Vascon.  [sebastiano.vascon-at-iit.it]
% Please email me if you have questions.
%
% Please cite this work
% [1] S. Vascon, E. Zemene , M. Cristani, H. Hung, M.Pelillo and V. Murino
% A Game-Theoretic Probabilistic Approach for Detecting Conversational Groups
% ACCV 2014

% -------------------------------------------- %
%              Detect Groups in a Single Frame %
% -------------------------------------------- %

close all
clear all
clc

fprintf('A Game-Theoretic Probabilistic Approach for Detecting Conversational Groups\nS. Vascon, E. Zemene , M. Cristani, H. Hung, M.Pelillo and V. Murino\nACCV2014\n');
fprintf('This is a basic setup for multiframe version ! For a more comprehensive one please see the demo.m file\n');

addpath(genpath('./'));

%% PARAMETERS
%Initialize the frustum and algorithm parameters
param.frustum.length=20;      %lenght of the frustum
param.frustum.aperture=160;   %aperture in degree
param.frustum.samples=2000;   %number of samples
param.hist.n_x=20;            %number of bin per rows
param.hist.n_y=20;            %number of bin per cols    
param.sigma=0.2;              %normalizing factor 
param.method='JS';            %type of distance (JS or KL)

%set the display parameters
param.show.frustum=1;
param.numFrames=2;

%% CREATE A SCENARIO
%create frames
frames=[];  

%create a frame [ PID , X, Y , HEAD ORJ]
frame_t1=[  1 , 100, 100 , pi; 
            2 , 120, 120 , pi/2; 
            3 , 90, 90 , pi/4]; 
frame_t2=[1 , 110, 110 , pi; 2 , 125, 125 , pi/2; 3 , 100, 100 , pi/4]; 
frame_t3=[1 , 125, 110 , pi; 2 , 130, 125 , pi/2; 3 , 105, 95 , pi/4]; 
frame_t4=[1 , 115, 110 , pi; 2 , 133, 125 , pi/2; 3 , 115, 85 , pi/4]; 

frames=[{frame_t1}, {frame_t2},{frame_t3},{frame_t4}];

detections=[];

for f=1:numel(frames)-param.numFrames+1 %cycle on the frames
    
    feat=frames(f:f+param.numFrames-1);  %copy the frames to analyze
    [groups, frustums,weights]=detectGroups(feat,param); %detect the groups using set of 2 frames (param.numFrames)
    detections=[detections ; {groups}];  %save the detections   
    
end

%display the groups starting from the first analyzed frame (the previous one has been used only to enforce the detection)
displayGroups(frames(param.numFrames:end),detections,[],1,param);  