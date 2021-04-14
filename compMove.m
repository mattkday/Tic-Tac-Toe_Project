function [] = compMove(iter)
    global board;
    global winr;
    [r,c] = scan_for_win(2);
    [rx,cx] = scan_for_win(1);
    %This if statement will stop the computer from moving if the winr is
    %true 
    if winr 
        disp('YOU WIN NICE JOB')
    elseif iter == 1    %first move
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

%decide next move using function(A, i) and if staements


%       Player O must always respond to a corner opening with a center mark, and to a center opening with a corner mark. 
%       An edge opening must be answered either with a center mark, a corner mark next to the X, or an edge mark opposite the X



%     Win: If the player has two in a row, they can place a third to get three in a row.

%     Block: If the opponent has two in a row, the player must play the third themselves to block the opponent.

%     Fork: Create an opportunity where the player has two ways to win (two non-blocked lines of 2).

%     Blocking an opponent's fork: If there is only one possible fork for the opponent, the player should block it. Otherwise, the player should block all forks in any way that simultaneously allows them to create two in a row. Otherwise, the player should create a two in a row to force the opponent into defending, as long as it doesn't result in them creating a fork. For example, if "X" has two opposite corners and "O" has the center, "O" must not play a corner move in order to win. (Playing a corner move in this scenario creates a fork for "X" to win.)

%     Center: A player marks the center. (If it is the first move of the game, playing a corner move gives the second player more opportunities to make a mistake and may therefore be the better choice; however, it makes no difference between perfect players.)

%     Opposite corner: If the opponent is in the corner, the player plays the opposite corner.

%     Empty corner: The player plays in a corner square.

%     Empty side: The player plays in a middle square on any of the 4 sides.




