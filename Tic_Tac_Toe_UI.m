% Objective: To implement the Tic Tac Toe game for a human user to play against the computer
% X = Human players move
% O = Computers move

% this is the main function that defines our game
function Tic_Tac_Toe_UI
% this makes the first move variable global and true 
global isfirstmove;
isfirstmove = 1;
% this makes the winr global and states that it starts false 
global winr; winr =0; 
global board;board=zeros(3)
% the board is defined as a 3x3 matrix 
% each button has been defined as a global variable so that it can be
% changed from another function and be able to update the UI

global pb1;global pb2;global pb3;
global pb4;global pb5;global pb6;
global pb7;global pb8;global pb9;

dbclear in Tic_Tac_Toe_UI %resets the non global values of the UI when run
%Creating the pop up user interface
figure('color', 'black','MenuBar','none','Name','Make a Move','Position',[200,300,285,300]); 

% This code defines and displays the restart button on the interface
pbR=uicontrol('Style','pushbutton',...
          'string','restart',...
          'Position',[ 115 30 60 63],...
          'Callback',@restart_game);...
% the following codes define and displays each game move button

% This board piece is located in row1,column1
pb1=uicontrol('Style', 'pushbutton',...
          'String', '[empty]',...
          'Position', [50 225 60 63],...
          'Callback', @brd_playAOne);
           
% This board piece is located in row2,column1     
pb2=uicontrol('Style', 'pushbutton',...
          'String', '[empty]',...
          'Position', [50 160 60 63],...
          'Callback', @brd_playBOne);       

% This board piece is located in row3,column1
pb3=uicontrol('Style', 'pushbutton',...
          'String', '[empty]',...
          'Position', [50 95 60 63],...
          'Callback', @brd_playCOne);    

% This board piece is located in row1,column2
pb4=uicontrol('Style', 'pushbutton',...
          'String', '[empty]',...
          'Position', [115 225 60 63],...
          'Callback', @brd_playATwo);...
          
% This board piece is located in row2,column2
pb5=uicontrol('Style', 'pushbutton',...
          'String', '[empty]',...
          'Position', [115 160 60 63],...
          'Callback', @brd_playBTwo);       

% This board piece is located in row3,column2
pb6=uicontrol('Style', 'pushbutton',...
          'String', '[empty]',...
          'Position', [115 95 60 63],...
          'Callback', @brd_playCTwo);    

% This board piece is located in row1,column3
pb7=uicontrol('Style', 'pushbutton',...
          'String', '[empty]',...
          'Position', [180 225 60 63],...
          'Callback', @brd_playAThree);...
          
% This board piece is located in row2,column3
pb8=uicontrol('Style', 'pushbutton',...
          'String', '[empty]',...
          'Position', [180 160 60 63],...
          'Callback', @brd_playBThree);       

% This board piece is located in row3,column3
pb9=uicontrol('Style', 'pushbutton',...
          'String', '[empty]',...
          'Position', [180 95 60 63],...
          'Callback', @brd_playCThree);    

% this function restarts the game after there has been a win or tie
function restart_game(src,event)%restarting game
    winr=0;
isfirstmove =1;
clc;
board=zeros(3)
%after restarting, this resets the computer to a new state
set(pb1,'String','[empty]')
set(pb2,'String','[empty]')
set(pb3,'String','[empty]')
set(pb4,'String','[empty]')
set(pb5,'String','[empty]')
set(pb6,'String','[empty]')
set(pb7,'String','[empty]')
set(pb8,'String','[empty]')
set(pb9,'String','[empty]')
end
end

%this function is meant to scan the board after each computer move and
%update the UI to show the current state of the game
% this has to me an unnested function so that it can be called by the pushbuttons
function CompMoveScan(src,event) 
   global pb1;global pb2;global pb3;  %calling all buttons to enable changing them
   global pb4;global pb5;global pb6;
   global pb7;global pb8;global pb9;
   global board;
   
   %the elseif command requires a previous if to be false, so multiple if
   %statements are needed
if board(1,1)==2  % scanning each position
    set(pb1,'String','O') %updates each cooreponding button if the statement is TRUE
end
if board(2,1)==2
    set(pb2,'String','O')
end
if board(3,1)==2
    set(pb3,'String','O')
end
if board(1,2)==2
    set(pb4,'String','O')
end
if board(2,2)==2
    set(pb5,'String','O')
end
if board(3,2)==2
    set(pb6,'String','O')
end
if board(1,3)==2
    set(pb7,'String','O')
end
if board(2,3)==2
    set(pb8,'String','O')
end
if board(3,3)==2
    set(pb9,'String','O')
end
    end


%the following functions coorespond to the buttons on the UI and change a
%single value on the board matrix


function brd_playAOne(src,event)
global board;
global isfirstmove;
global winr; 
%this if statment scans if the move is legal/ if a win condition is met
%then it will run the computer move if the player has not played there
    if legality_scanner(1,1)   
        set(src,'Str','X')
        win_scan()
        compMove(isfirstmove) 
        win_scan()
     CompMoveScan()
        board % only displayed for testing and presentation purposes
    
    end
    
end

function brd_playBOne(src,event)
global board;
global isfirstmove;
global winr; 
%this if statment scans if the move is legal/ if a win condition is met
%then it will run the computer move if the player has not played there
if legality_scanner(2,1) 
       set(src,'Str','X')
        win_scan()
        compMove(isfirstmove)        
        win_scan()
     CompMoveScan()
        board 
    end
end

function brd_playCOne(src,event)
global board;
global isfirstmove;
global winr; 
%this if statment scans if the move is legal/ if a win condition is met
%then it will run the computer move if the player has not played there
if legality_scanner(3,1) 
  set(src,'Str','X')
        win_scan()
        compMove(isfirstmove)        
        win_scan()
     CompMoveScan()
        board 
    end
end

function brd_playATwo(src,event)
global board;
global isfirstmove;
global winr; 
%this if statment scans if the move is legal/ if a win condition is met
%then it will run the computer move if the player has not played there
if legality_scanner(1,2) 
         set(src,'Str','X')
        win_scan()
        compMove(isfirstmove)        
        win_scan()
     CompMoveScan()
        board 
    end
end

function brd_playBTwo(src,event)
global board;
global isfirstmove;
global winr; 
%this if statment scans if the move is legal/ if a win condition is met
%then it will run the computer move if the player has not played there
if legality_scanner(2,2) 
         set(src,'Str','X')
        win_scan()
        compMove(isfirstmove)        
        win_scan()
     CompMoveScan()
        board 
    end
end

function brd_playCTwo(src,event)
global board;
global isfirstmove;
global winr; 
%this if statment scans if the move is legal/ if a win condition is met
%then it will run the computer move if the player has not played there
if legality_scanner(3,2) 
         set(src,'Str','X')
        win_scan()
        compMove(isfirstmove)        
        win_scan()
     CompMoveScan()
        board 
    end
end

function brd_playAThree(src,event)
global board;
global isfirstmove;
global winr; 
%this if statment scans if the move is legal/ if a win condition is met
%then it will run the computer move if the player has not played there
if legality_scanner(1,3) 
      set(src,'Str','X')
        win_scan()
        compMove(isfirstmove)        
        win_scan()
     CompMoveScan()
        board 
    end
end

function brd_playBThree(src,event)
global board;
global isfirstmove;
global winr; 
%this if statment scans if the move is legal/ if a win condition is met
%then it will run the computer move if the player has not played there
if legality_scanner(2,3) 
        set(src,'Str','X')
        win_scan()
        compMove(isfirstmove)        
        win_scan()
     CompMoveScan()
        board 
    end
end

function brd_playCThree(src,event)
global board;
global isfirstmove;
global winr; 
%this if statment scans if the move is legal/ if a win condition is met
%then it will run the computer move if the player has not played there
if legality_scanner(3,3) 
          set(src,'Str','X')
        win_scan()
        compMove(isfirstmove)        
        win_scan()
     CompMoveScan()
        board 
    end
end