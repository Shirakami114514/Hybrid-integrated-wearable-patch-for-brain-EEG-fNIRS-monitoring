% clear
clc; clear; close all;

% prepare
strCells_Words = {'绿'; '红'; '蓝'};
strCells_Words_Eng = {'Green'; 'Red'; 'Blue'};
strCells_Colors = {[0 1 0]; [1 0 0]; [0 0 1]};
strCells_Colors_Eng = {'GREEN'; 'RED'; 'BLUE'};

% LOOP x LOOP
for i = 1:length(strCells_Words)
    for j = 1:length(strCells_Colors)
        tmpWord = strCells_Words{i};
        tmpWord_Eng = strCells_Words_Eng{i};
        tmpColor = strCells_Colors{j};
        tmpColor_Eng = strCells_Colors_Eng{j};
        t = generate_colorWords_Fcn(tmpWord, tmpWord_Eng, tmpColor, tmpColor_Eng);
        
    end
end