%Matthew Day
%this function makes the movement decisions for the computer
function [] = compMove(iter)
global isfirstmove
global board;
global winr;
[r,c] = scan_for_win(2);
[rx,cx] = scan_for_win(1);

%This if statement will stop the computer from moving if the winr is
%true
if winr ==1
    disp('GAME OVER')
elseif isfirstmove == 1    %first move
%   Player O must always respond to a corner opening with a center mark, and to a center opening with a corner mark.
%   An edge opening must be answered either with a center mark, a corner mark next to the X, or an edge mark opposite the X
    if board(2,2) == 1; board(1,1) = 2;
    elseif board(2,2) == 0
        board(2,2) = 2; % next move should be ?
    end
    isfirstmove=0;
elseif r ~= -1   %Win
%   Win: If the player has two in a row, they can place a third to get three in a row.
    board(r,c) = 2;
    %O wins
elseif rx ~= -1  %block
%   Block: If the opponent has two in a row, the player must play the third themselves to block the opponent.
    board(rx,cx) = 2;
    %The following code was suppossed to either create a fork or block an opposing fork, but it has bugs so we excluded it 
    %elseif scanForks(2) ~= -1   %fork
    %     Fork: Create an opportunity where the player has two ways to win (two non-blocked lines of 2).
    %         board(scanForks(2)) = 2;
    %         %disp('fork');
    %elseif scanForks(1) ~= -1     %block fork
    %     Blocking an opponent's fork: If there is only one possible fork for the opponent, the player should block it. Otherwise, the player should block all forks in any way that simultaneously allows them to create two in a row. Otherwise, the player should create a two in a row to force the opponent into defending, as long as it doesn't result in them creating a fork. For example, if "X" has two opposite corners and "O" has the center, "O" must not play a corner move in order to win. (Playing a corner move in this scenario creates a fork for "X" to win.)
    %         board(scanForks(1)) = 2;
    %        % disp('block fork');
elseif board(2,2) == 0      %center
%   Center: A player marks the center. (If it is the first move of the game, playing a corner move gives the second player more opportunities to make a mistake and may therefore be the better choice; however, it makes no difference between perfect players.)
    board(2,2) = 2;
elseif opp_corner      %opposite corner
%   Opposite corner ^: If the opponent is in the corner, the player plays the opposite corner.
    
    
%   Empty corner: The player plays in a corner square.
elseif board(1,1) == 0
    board(1,1) = 2;
elseif board(3,3) == 0
    board(3,3) = 2;
elseif board(1,3) == 0
    board(1,3) = 2;
elseif board(3,1) == 0
    board(3,1) = 2;
    
%   Empty side: The player plays in a middle square on any of the 4 sides.
elseif board(1,2) == 0
    board(1,2) = 2;
elseif board(2,1) == 0
    board(2,1) = 2;
elseif board(2,3) == 0
    board(2,3) = 2;
elseif board(3,2) == 0
    board(3,2) = 2;
else
    %fprintf("somthing went wrong");
end

end
%matthew DeRouen changes:
%i replaced iter with isfirstmove and made it global
%this appears to have made no change at all so the overwriting bug is
%somewhere in the scan forks or scan_for_win



