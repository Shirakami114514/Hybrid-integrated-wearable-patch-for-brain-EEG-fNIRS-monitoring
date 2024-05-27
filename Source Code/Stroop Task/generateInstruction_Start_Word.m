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
set(hFigure, 'position',[100 50 1920 1080], 'color',bkgColor);    % scale 16:9
 
% create a uicontrol
hText_Kaishi = uicontrol('Style','Text', 'String','指导语', 'Fontname','Microsoft Yahei', 'Position',[800 900 300 80], 'Fontsize',50, 'Backgroundcolor',bkgColor, 'ForegroundColor',fontColor);

% % 
tmpInstr = sprintf('这是一个测定反应快慢和准确率的实验。当你看到屏幕中心出现的彩色字的时候，请根据字的颜色选择对应的按键。\n如果字体颜色为绿色，请按J键；\n如果字体颜色为红色，请按K键；\n如果字体颜色为蓝色，请按L键。');
hText_Content = uicontrol('style','text', 'String',tmpInstr, 'fontname','Microsoft Yahei', 'position',[301 301 1300 500], 'fontsize',36, 'backgroundcolor',bkgColor, 'HorizontalAlign','left', 'ForegroundColor',fontColor);
% 
tmpGo = '请按空格开始正式实验';
hText_Go = uicontrol('style','text', 'HorizontalAlign','center', 'String',tmpGo, 'fontname','Microsoft Yahei', 'position',[301 121 1300 100], 'fontsize',36, 'Backgroundcolor',bkgColor, 'ForegroundColor',fontColor);

% snapshot
hFrame = getframe(gcf);
imgInstruction = hFrame.cdata;

jpgFileName_instruction = 'Instruction_Start_Word.jpg';
jpgPathName_instruction = sprintf('%s/%s', picFolderName, jpgFileName_instruction);
imwrite(imgInstruction, jpgPathName_instruction, 'jpg');