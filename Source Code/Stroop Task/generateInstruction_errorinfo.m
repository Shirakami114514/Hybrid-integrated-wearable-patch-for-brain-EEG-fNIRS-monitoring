% filename is:: generateInstruction_errorinfo.m

% clear
clc; clear; close all;

% prepare picFolderName
picFolderName = 'Pics';

if ~exist(picFolderName, 'dir')
    mkdir(picFolderName);
end

% prepare bkgColor
bkgColor = [0 0 0];
fontColor = [1 1 1];

% create a figure
hFigure = figure(1);
set(hFigure, 'position',[100 50 300 300], 'color',bkgColor);    % scale 16:9
 
% create a uicontrol
hText_Kaishi = uicontrol('Style','Text', 'String','反应错误！', 'Fontname','Microsoft Yahei', 'Position',[20 80 300 100], 'Fontsize',36, 'Backgroundcolor',bkgColor, 'ForegroundColor',fontColor);

% % 
% tmpInstr = sprintf('这是一个测定反应快慢和准确率的实验。当你看到屏幕中心出现的彩色字的时候，请根据字义名称选择对应的按键。\n如果字义为绿色，请按J键；\n如果字义为红色，请按K键；\n如果字义为蓝色，请按L键。');
% hText_Content = uicontrol('style','text', 'String',tmpInstr, 'fontname','Microsoft Yahei', 'position',[301 301 1300 500], 'fontsize',36, 'backgroundcolor',bkgColor, 'HorizontalAlign','left', 'ForegroundColor',fontColor);
% 
% tmpGo = '请按空格开始正式实验';
% hText_Go = uicontrol('style','text', 'HorizontalAlign','center', 'String',tmpGo, 'fontname','Microsoft Yahei', 'position',[301 121 1300 100], 'fontsize',36, 'Backgroundcolor',bkgColor, 'ForegroundColor',fontColor);

% snapshot
hFrame = getframe(gcf);
imgInstruction = hFrame.cdata;

jpgFileName_instruction = 'Errorinfo.jpg';
jpgPathName_instruction = sprintf('%s/%s', picFolderName, jpgFileName_instruction);
imwrite(imgInstruction, jpgPathName_instruction, 'jpg');