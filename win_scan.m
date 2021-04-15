%Matthew DeRouen
%last update on: 4/15/2021

%making a program to determine whether or not a winning position has been
%played

%call this function after each move is made to check for winning placements

function win_scan()
global board;
%this is the global win statement 
global winr;

for i=1:3 %checking horizontal and vertical forks at the same time
    %checking rows for win
    %----------------------------------------------------------------
    if board(i,1:3)==1 | board(i,1:3)==2     
        win_value=board(i,1:3);%placeholder for determining who won
        %determining winner based on stored value
        if win_value==[2,2,2]
            fprintf('the computer wins by line on row %f \n',i)
            winr = 1; %used to lock player input after finished game
        elseif win_value==[1,1,1]
            fprintf('you win by line on row %f \n',i)
            winr = 1;
        end
    end


    %checking columns for win
    %--------------------------------------------------------------------
       if board(1:3,i)==1 | board(1:3,i)==2
        win_value= board(1:3,i);%choosing value on winning line to determine who won
        %determining winner
            if win_value==[2,2,2]
              fprintf('the computer wins by line on column %f \n',i) %win announced
              winr =1;%changes to boolean of 1 to use for player lockout in legality_scanner
            elseif win_value==[1,1,1]
              fprintf('you win by line on column %f \n',i)
              winr =1;
            end
       end
end     
  %check diagonals for win
  %-----------------------------------------------------------------
       if diag(board)==1%forward diagonal
           disp('player wins by line on forward diagonal')
           winr =1;
       elseif diag(board)==[2;2;2]
           disp('computer wins by line on forward diagonal')
           winr =1;
       end
%backwards diagonal is a bit longer
diag_vec=[0,0,0];%placeholder for monitored vector
 for j=0:2
     diag_vec(1+j)=board(1+j,3-j);%making backwards diagonal into a vector
 end
 %determine winner by stored diagonal
 if diag_vec==[1,1,1]
     disp('the player wins by line on backwards diagonal')
     winr =1;
 elseif diag_vec==[2,2,2]
     disp('the computer wins by line on backwards diagonal')
     winr =1;
 end
 Tboard=board; %making a placeholder board to check for full game board rather than using iterations
for r=1:3   
    for c=1:3
        if Tboard(r,c)~= 0  %scanning the entire board and replacing nonzero values with a one to compare to full board
            Tboard(r,c)=1;
        end 
    end
end
if Tboard== ones(3,3)
    disp('Tie! Try Again') %this can only be reached if a winner hasnt been determined yet and board is filled
end
end

 %added:
 %I made it able to detect a tie and display a message stating this 


