function cjMatrix_color = generate_cjMatrix_Color()

% prepare parameters
ItemNum = 12;
RepeatNum = 2;
TrialNum = 24;

correctResponse_repeatUpperLimit = 4;

% prepare Columns
TrialID_Column = 1;
Word_Column = 2;
Color_Column = 3;
Type_Column = 4;
CorrectResponse_Column = 5;

% prepare strCells
% prepare
strCells_Words = {'绿'; '红'; '蓝'};   % lv == 1 vs. ho == 2 vs. la == 3
strCells_Words_Eng = {'Green'; 'Red'; 'Blue'};
strCells_Colors = {[0 1 0]; [1 0 0]; [0 0 1]};
strCells_Colors_Eng = {'GREEN'; 'RED'; 'BLUE'};



% while loop
while 1
    % each arr
    % trialid
    arr_TrialID = (1:TrialNum)';   % OK
    
    % word
    oriArr_word = [1 2 3]';
    arr_word_9 = kron(oriArr_word, ones(3,1));
    
    % color
    oriArr_color = [1 2 3]';
    arr_color_9 = [oriArr_color;oriArr_color;oriArr_color];
    
    % combine
    tmpMat_9 = [arr_word_9 arr_color_9];   % 1 -> 9
    
    
    
    % coreItem_Arr
    coreItem_Arr = 1:9;
    coreItem_Arr = coreItem_Arr';
    
    % congruent
    oriArr_Con_3 = [1; 5; 9];
    oriArr_Inc_6 = [2;3;4;6;7;8];
    oriArr_coreItems_12 = [oriArr_Con_3; oriArr_Con_3; oriArr_Inc_6];
    
    % oriArr_core x 2 <-- repeatnum
    arr_Type_24 = kron(oriArr_coreItems_12,ones(RepeatNum,1));
    
    tmpMat_24 = [];
    % type --> word + color
    for n = 1:length(arr_Type_24)
        tmpRow = arr_Type_24(n);
        tmpArr_2_word_color = tmpMat_9(tmpRow,:);
        tmpMat_24 = [tmpMat_24; tmpArr_2_word_color];
    end
    
    arr_Word_24 = tmpMat_24(:,1);
    arr_Color_24 = tmpMat_24(:,2);
    
    arr_CorrectResponse_24 = arr_Color_24;
    
    randArr = randperm(TrialNum)';
    tmpMatrix_24_5cols = [arr_Word_24 arr_Color_24 arr_Type_24 arr_CorrectResponse_24 randArr];
    tmpMat_24_5cols_Rand = sortrows(tmpMatrix_24_5cols,5);
    matrix_24_4cols_r = tmpMat_24_5cols_Rand(:,1:4);
    
    matrix_24_5cols_r = [arr_TrialID matrix_24_4cols_r];
    
    % get the correctResponse Array for checking
    correctResponseArray = matrix_24_5cols_r(:,CorrectResponse_Column);
    
    count_repeat = 1;
    count_repeat_Max = 1;
    for k = 2:length(correctResponseArray)
        if correctResponseArray(k) == correctResponseArray(k-1)
            count_repeat = count_repeat + 1;
            if count_repeat > count_repeat_Max
                count_repeat_Max = count_repeat;
            end
        else
            count_repeat = 1;
        end
        
    end
    
    if count_repeat_Max > correctResponse_repeatUpperLimit
        continue;
    else
        break;
    end
    
    
end

% output the cjMatrix_color
cjMatrix_color = matrix_24_5cols_r;

end