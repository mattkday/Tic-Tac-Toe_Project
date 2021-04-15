function [r] = opp_corner()
    global lr;
    global lc;
    global board
    r = 0;
    
    if lr == 1 && lc == 1
        if board(3,3) == 0
            board(3,3) = 2;
            r = 1;
        end
    elseif lr == 3 && lc == 3
        if board(1,1) == 0
            board(1,1) = 2;
            r = 1;
        end
    elseif lr == 1 && lc == 3
        if board(3,1) == 0
            board(3,1) = 2;
            r = 1;
        end
    elseif lr == 3 && lc == 1
        if board(1,3) == 0
            board(1,3) = 2;
            r = 1;
        end
    end
        
end

