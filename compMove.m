function [] = compMove(iter)
    global board;
    [r,c] = scan_for_win(2);
    [rx,cx] = scan_for_win(1);
    if iter == 1    %first move
        if board(2,2) == 1; board(1,1) = 2;
        else
            board(2,2) = 2; % next move should be ?
        end
    elseif r ~= -1   %Win
        board(r,c) = 2;
        %O wins
    elseif rx ~= -1  %block
        board(rx,cx) = 2;
    elseif scanForks(2) ~= -1   %fork
        board(scanForks(2)) = 2;
        disp('fork');
    elseif scanForks(1) ~= -1     %block fork
        board(scanForks(1)) = 2;
        disp('block fork');
    elseif board(2,2) == 0      %center
        board(2,2) = 2;
    elseif false      %opposite corner
        
    elseif false      %empty corner
    else         %empty side
        
    end
                
end






