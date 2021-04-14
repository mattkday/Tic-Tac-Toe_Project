%Lee Terrebonne
%4/14/21
%Legality Scanner




function [k] = legality_scanner(r,c)
k =0;
global board

%Checking to see if move is legal
if board(r,c) == 0
    
    board(r,c) = 1
    k =1;
    win_scan()

%Retry
else 
    disp('Position already chosen, please try again. \n')
    
    
end

end