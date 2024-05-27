% clear
clc;clear; close all;


% prepare the material folder
picsFolderName = 'Pics';

if ~exist(picsFolderName,'dir')
     mkdir(picsFolderName);
end

% prepare fixation color
bkgColor = [0 0 0];

% prepare the width and height of the figure and fixation
figWidth = 300;
figHeight = 300;
fixationWidth = 120;
fixationHeight = 120;

% create a figure
hFigure = figure(1);
set(hFigure, 'position', [100 100 figWidth figHeight],'color',bkgColor);

% create an axes, and put it in the middle horizontally and vertically
hAxes = axes('parent',hFigure);
hAxes_PosX = (figWidth - fixationWidth)/2 + 1;
hAxes_PosY = (figHeight - fixationHeight)/2 + 1;
set(hAxes, 'units','pixels', 'position',[hAxes_PosX hAxes_PosY fixationWidth fixationHeight]);

% generate image matrix, in Black
imgMatrix = zeros(fixationHeight, fixationWidth, 3);
imgMatrix(41:80,:,1) = 1;   % r
imgMatrix(41:80,:,2) = 1;   % g
imgMatrix(41:80,:,3) = 1;   % b

imgMatrix(:,41:80,1) = 1;   % r
imgMatrix(:,41:80,2) = 1;   % g
imgMatrix(:,41:80,3) = 1;   % b

% show image
imshow(imgMatrix, 'parent',hAxes);

% get frame
hFrame = getframe(gcf);
hImage_Fixation = hFrame.cdata;

% save
fixationFileName = 'fixation.jpg';
fixationPathName = sprintf('%s/%s', picsFolderName, fixationFileName);
imwrite(hImage_Fixation, fixationPathName, 'jpg');