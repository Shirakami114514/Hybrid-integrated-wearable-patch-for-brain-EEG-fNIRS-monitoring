function y = generate_colorWords_Fcn(tmpWord, tmpWord_Eng, tmpColor, tmpColor_Eng)

% prepare
picsFolderName = 'Pics';

% create a figure
hFigure = figure(1);
set(hFigure, 'position',[100 100 300 300]);

% create an axes
hAxes = axes('parent',hFigure);
set(hAxes, 'units','pixels', 'position',[1 1 300 300]);

% generate an image matrix
imgMat = zeros(300, 300, 3); % 3 == r g b

% show the imgMat
imshow(imgMat, 'parent',hAxes);

% text
% tmpWord = '绿';
% tmpWord_Eng = 'Green';
% tmpColor = [1 0 0];  % red
% tmpColor_Eng = 'RED';
text(150, 150, tmpWord, 'fontsize',80, 'fontname','Microsoft YaHei', 'HorizontalAlign','center', 'VerticalAlign','middle', 'color',tmpColor);

% snapshot
hFrame = getframe(gcf);
imgWord = hFrame.cdata;

% save
jpgFileName = sprintf('word_%s_color_%s.jpg', tmpWord_Eng, tmpColor_Eng);
jpgPathName = sprintf('%s/%s', picsFolderName, jpgFileName);
imwrite(imgWord, jpgPathName,'jpg');



y = 1;

end