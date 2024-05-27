function y = Instruction(p_window,InsPic)

Screen('PutImage',p_window, InsPic);
Screen('Flip',p_window);

key_Space=KbName('Space');
while 1
    [~, key_Code, ~]=KbWait([], 3);     %监听按键
    if key_Code(key_Space)
        break;
    end
end

Screen('FillRect',p_window,[0 0 0]);  % 颜色设置这里后期可能需要修改，这里是黑色，脑电实验经验为背景为192,192,192的灰色
Screen('Flip',p_window);

end




