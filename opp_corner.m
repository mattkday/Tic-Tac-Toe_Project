function [r] = opp_corner()
    global lr;%players last row and column
    global lc;
    global board
    r = 0; %return 1 if the pmove is made
    
    %this function makes a move opposite of the player's corner
    if lr == 1 && lc == 1%top right corner
        if board(3,3) == 0
            board(3,3) = 2;
            r = 1;
        end
    elseif lr == 3 && lc == 3 %bottom right corner
        if board(1,1) == 0
            board(1,1) = 2;
            r = 1;
        end
    elseif lr == 1 && lc == 3 %top right corner
        if board(3,1) == 0
            board(3,1) = 2;
            r = 1;
        end
    elseif lr == 3 && lc == 1 %bottom left corner
        if board(1,3) == 0
            board(1,3) = 2;
            r = 1;
        end
    end
        
end

