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
fprintf('This is a basic setup ! For a more comprehensive one please see the demo.m file\n');

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

%% CREATE A SCENARIO
%create frames
frames=[];  

%create a frame [ PID , X, Y , HEAD ORJ]
frame_t1=[  1 , 100, 100 , pi; 
            2 , 120, 120 , pi/2; 
            3 , 90, 90 , pi/4];         
frames=[frames , {frame_t1}];   

%% DETECT GROUPS
[groups, frustums,weights]= detectGroups(frames,param); %detect the groups

%% DISPLAY GROUPS
displayGroups(frames,{groups},[],1,param);  %display the groups 