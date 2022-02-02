clear all
close all
clc
load('data.mat');

sfsOpFeature = sequentialForward(classes);
sbsOpFeature = sequentialBackward(classes);

