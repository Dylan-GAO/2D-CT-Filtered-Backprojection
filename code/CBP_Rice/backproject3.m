% backproject3.m

%% This is a MATLAB function that takes filtered back projections without 
%% using the 'imrotate' command.  Here, we try to cut out all the loops. 
%% PR is a matrix whose columns are the projections at each angle. 
%% THETA is a row vector of the angles of the respective projections.
%%
%% Written by : Justin K. Romberg

function [BPI,M] = backproject3(PR, THETA)

% figure out how big our picture is going to be.
n = size(PR,1);
sideSize = n;

% filter the projections
filtPR = filtersinc(PR);
%filtPR = PR;

% convert THETA to radians
th = (pi/180)*THETA;

% set up the image
m = length(THETA); 
BPI = zeros(sideSize,sideSize);

% find the middle index of the projections
midindex = (n+1)/2;

% set up x and y matrices
x = 1:sideSize;
y = 1:sideSize;
[X,Y] = meshgrid(x,y);
xpr = X - (sideSize+1)/2;
ypr = Y - (sideSize+1)/2;

% loop over each projection
figure
colormap(jet)
M = moviein(m);
for i = 1:m
    tic
    disp(['On angle ', num2str(THETA(i))]);

    % figure out which projections to add to which spots
    filtIndex = round(midindex + xpr*sin(th(i)) - ypr*cos(th(i)));

    % if we are "in bounds" then add the point
    BPIa = zeros(sideSize,sideSize);
    spota = find((filtIndex > 0) & (filtIndex <= n));
    newfiltIndex = filtIndex(spota);
    BPIa(spota) = filtPR(newfiltIndex(:),i);
    %keyboard 
    BPI = BPI + BPIa;
    toc
    %% 
    imagesc(BPI)
    M(:,i) = getframe;
    %figure
    %plot(filtPR(:,i));
    %keyboard
end

BPI = BPI./m;