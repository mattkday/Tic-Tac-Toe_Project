function [r,c] = scan_for_win(player)
    %this function checks for a winning move for either the player or the
    %computer depending oon what is passed as player
    global board;
    boardt = board';
    r = -1; c = -1;
    for i = 1:3%loop through all rows and columns
        %check rows
        if length(find(board(i,:) == player)) == 2 && length(find(~board(i,:))) == 1
            r = i;
            c = find(~board(i,:));
            break
        elseif length(find(boardt(i,:) == player)) == 2 && length(find(~boardt(i,:))) == 1
            %check columns
            c = i;
            r = find(~boardt(i,:));
            break
        end
    end
    if length(find(diag(board) == player)) == 2 && length(find(~diag(board))) == 1
        %check first diag
        f = find(~diag(board)');
        r = f;
        c = r;
    elseif length(find(diag(rot90(board)) == player)) == 2 && length(find(~diag(rot90(board)))) == 1
        %second diag
        f = find(~diag(rot90(board))');
        c = 4- f;
        r = f;
    end
end