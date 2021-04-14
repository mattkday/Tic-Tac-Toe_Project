%Lee Terrebonne
%4/14/21
%Legality Scanner



function [] = legality_scanner(v)

global board

%Checking to see if move is legal
if board(v) ~= 0
    
    board(v) = 1
    
    
%Retry
else 
    disp('Position already chosen, please try again. \n')
    
    
end

end