%Matthew DeRouen
%4/8/2021
%too late at night to find the time
%making a program to determine whether or not a winning position has been
%played

%call this function after each move is made to check for winning placements

function[]=win_scan()
global board;
global winr;

for i=1:3 %checking horizontal and vertical forks at the same time
    %checking rows for win
    %----------------------------------------------------------------
    if board(i,1:3)==1 | board(i,1:3)==2     
        win_value=board(i,1:3);%placeholder for determining who won
        %determining winner based on stored value
        if win_value==[2,2,2]
            fprintf('the computer wins by line on row %f \n',i)
            winr = 1;
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
              fprintf('the computer wins by line on column %f \n',i)
              winr =1;
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

end

%% changes needed
%--------------------------------------------------------
%needs plugin to the interface to display the messages 
 %needs to be checked in the case that variables dont conflict with other parts
 
 %% DONE
 %--------------------------------------------------------
 %board variable name might need to be changed to "global" i saw that it
 %was an operator so i didnt try to bother with it.

