function [rt acc] = singleTrial(wptr, cjMatrix, ID, imgMatrix_Fixation, cjSeries, imgMat_Error)

% prepare foldernames
picFolderName = 'Pics';

% prepare colors
bkgColor = [0 0 0];

% prepare Columns
TrialID_Column = 1;
Word_Column = 2;
Color_Column = 3;
Type_Column = 4;
CorrectResponse_Column = 5;

% prepare parameters
fixation_Interval = 0.5;  % 500 ms
blank_Interval_200 = 0.2;     % 200 ms
timeInterval_showError = 1;
timeUpperLimit = 3;
blank_Interval_3000 = 3;
blank_Interval_1000 = 1;

% 设置按键的准备情况
KbName('UnifyKeyNames');

% 准备好三个按键的向量
KeyPressArray = [KbName('j') KbName('k') KbName('l')];       %定义3个按键



% 开始
% 空屏1秒
Screen('FillRect', wptr,bkgColor);  %准备黑屏
Screen('Flip', wptr);        %黑屏
WaitSecs(blank_Interval_1000);    %Duration

% show the fixation for 
Screen('PutImage',wptr, imgMatrix_Fixation);
Screen('Flip',wptr);
WaitSecs(fixation_Interval);    %Duration == 500 ms

% 空屏1秒
Screen('FillRect', wptr,bkgColor);  %准备黑屏
Screen('Flip', wptr);        %黑屏
WaitSecs(blank_Interval_200);    %Duration

% show the cj
cjItem_ID = cjMatrix(ID, Type_Column);
imgMatrix_colorWord = cjSeries{cjItem_ID};
Screen('PutImage',wptr, imgMatrix_colorWord);
Screen('Flip',wptr);

t0 = GetSecs;   %启动计时器

while 1     %等待被试反应
    [~, t, key_Code] = KbCheck;      %监听按键
    
    % 如果按键为 j k l 三个中的任意一个
    if key_Code(KbName('j')) | key_Code(KbName('k')) | key_Code(KbName('l'))
        rt = t - t0;
        acc = key_Code(KeyPressArray(cjMatrix(ID, CorrectResponse_Column)));
%         if acc == 1
              break;
%         else
%               
%         end
    end

    % 如果按键为ESC
    if key_Code(KbName('ESCAPE'))  %如果按键为esc，返回值为1
        rt = 9999;    %ACC为999，进行标记，用于退出程序
        acc = 9999;
        break;
    end
    
    % 如果不按键，超时了
    tt = GetSecs;   %启动计时器
    if tt-t0>timeUpperLimit
        rt = 3000;
        acc = 0;
        break;
    end
    
    
end


% 如果做错了，呈现一个错误提示信息1s
if acc == 9999

else
    if acc
        
    else
        % 空屏0.2秒
        Screen('PutImage',wptr, imgMat_Error);
        Screen('Flip',wptr);
        WaitSecs(timeInterval_showError);    %Duration
    end
    
end


end