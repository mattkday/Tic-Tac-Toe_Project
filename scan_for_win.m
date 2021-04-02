function [r,c] = scan_for_win(player)
    global board;
    boardt = board';
    r = -1; c = -1;
    for i = 1:3
        if length(find(board(i,:) == player)) == 2 && length(find(~board(i,:))) == 1
            r = i;
            c = find(~board(i,:));
            break
        elseif length(find(boardt(i,:) == player)) == 2 && length(find(~boardt(i,:))) == 1
            c = i;
            r = find(~boardt(i,:));
            break
        end
    end
    if length(find(diag(board) == player)) == 2 && length(find(~diag(board))) == 1
        f = find(~diag(board)');
        r = f;
        c = r;
    elseif length(find(diag(rot90(board)) == player)) == 2 && length(find(~diag(rot90(board)))) == 1
        f = find(~diag(rot90(board))');
        c = 4- f;
        r = f;
    end
end