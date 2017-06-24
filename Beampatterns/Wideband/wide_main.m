%% This is a program for plotting the beampattern of wideband signals
clc;
close all;
clearvars;
%% ------- SET PARAMETER VALUES -----
fs          = 16000;
micNum      = 10;
micType     = 'circular';
alg         = 'DSB';
doa         = 180;
c           = 342;
freq_vec    = [100,	8000];

%% ------- COMPUTE MICROPHONE POSITIONS -----
switch micType
    case 'linear'
        d = 0.02;
        micPos(:,1) = [0:d:(micNum-1)*d];
        micPos(:,2) = zeros(micNum,1);
    case 'circular'
        r = 0.1;
        theta = [0:360/micNum:(micNum-1)*360/micNum];
        micPos(:,1) = r*cosd(theta);
        micPos(:,2) = r*sind(theta);
end
micPos = micPos.';             
%%   
plot_wide(freq_vec,micPos,doa,c)


