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
figure('color', 'black','MenuBar','none','Name','Make a Move','Position',[630,350,300,440]);


% This code defines and displays the restart button on the interface
pbR=uicontrol('Style','pushbutton','Backgroundcolor','[0.4940 0.1840 0.5560]',...
    'string','restart','Fontsize',12,...
    'Position',[ 100 0 100 100],...
    'Callback',@restart_game);...
    set(pbR,'Foregroundcolor','[0.9290 0.6940 0.1250]')

% the following codes define and displays each game move button

% This board piece is located in row1,column1
pb1=uicontrol('Style', 'pushbutton','Backgroundcolor','[0.4940 0.1840 0.5560]',...
    'String', '[empty]','Fontsize',8,...
    'Position', [0 300 100 100],...
    'Callback', @brd_playAOne);
set(pb1,'Foregroundcolor','[0.9290 0.6940 0.1250]')
% This board piece is located in row2,column1
pb2=uicontrol('Style', 'pushbutton','Backgroundcolor','[0.4940 0.1840 0.5560]',...
    'String', '[empty]',...
    'Position', [0 200 100 100],...
    'Callback', @brd_playBOne);

% This board piece is located in row3,column1
set(pb2,'Foregroundcolor','[0.9290 0.6940 0.1250]')
pb3=uicontrol('Style', 'pushbutton','Backgroundcolor','[0.4940 0.1840 0.5560]',...
    'String', '[empty]',...
    'Position', [0 100 100 100],...
    'Callback', @brd_playCOne);

% This board piece is located in row1,column2
set(pb3,'Foregroundcolor','[0.9290 0.6940 0.1250]')
pb4=uicontrol('Style', 'pushbutton','Backgroundcolor','[0.4940 0.1840 0.5560]',...
    'String', '[empty]',...
    'Position', [100 300 100 100],...
    'Callback', @brd_playATwo);...
    
set(pb4,'Foregroundcolor','[0.9290 0.6940 0.1250]')

% This board piece is located in row2,column2
pb5=uicontrol('Style', 'pushbutton','Backgroundcolor','[0.4940 0.1840 0.5560]',...
    'String', '[empty]',...
    'Position', [100 200 100 100],...
    'Callback', @brd_playBTwo);

set(pb5,'Foregroundcolor','[0.9290 0.6940 0.1250]')

% This board piece is located in row3,column2
pb6=uicontrol('Style', 'pushbutton','Backgroundcolor','[0.4940 0.1840 0.5560]',...
    'String', '[empty]',...
    'Position', [100 100 100 100],...
    'Callback', @brd_playCTwo);

set(pb6,'Foregroundcolor','[0.9290 0.6940 0.1250]')
% This board piece is located in row1,column3
pb7=uicontrol('Style', 'pushbutton','Backgroundcolor','[0.4940 0.1840 0.5560]',...
    'String', '[empty]',...
    'Position', [200 300 100 100],...
    'Callback', @brd_playAThree);...
    
set(pb7,'Foregroundcolor','[0.9290 0.6940 0.1250]')

% This board piece is located in row2,column3
pb8=uicontrol('Style', 'pushbutton','Backgroundcolor','[0.4940 0.1840 0.5560]',...
    'String', '[empty]',...
    'Position', [200 200 100 100],...
    'Callback', @brd_playBThree);

set(pb8,'Foregroundcolor','[0.9290 0.6940 0.1250]')
% This board piece is located in row3,column3
pb9=uicontrol('Style', 'pushbutton','Backgroundcolor','[0.4940 0.1840 0.5560]',...
    'String', '[empty]',...
    'Position', [200 100 100 100],...
    'Callback', @brd_playCThree);

set(pb9,'Foregroundcolor','[0.9290 0.6940 0.1250]')

%This code creates the title textbox with color and background
Title=uicontrol('Style','text','Position',[50 420 200 20],'String','TIC TAC TIGER','FontSize',12,'FontWeight','bold');
set(Title,'Foregroundcolor','[0.9290 0.6940 0.1250]');set(Title,'Backgroundcolor','[0.4940 0.1840 0.5560]');
%This code tells what gods created it with the color and background
Names=uicontrol('Style','text','Position',[50 400 200 20],'String','Made by: Matt^3, Devin, Lee','FontSize',10,'FontWeight','bold');
set(Names,'Foregroundcolor','[0.9290 0.6940 0.1250]');set(Names,'Backgroundcolor','[0.4940 0.1840 0.5560]');

% this function restarts the game after there has been a win or tie
    function restart_game(src,event)%restarting game
        winr=0;
        isfirstmove =1;
        clc;
        
        board=zeros(3);
        %resetting the UI to new game state
        set(pb1,'String','[empty]','Fontsize',8)
        set(pb2,'String','[empty]','Fontsize',8)
        set(pb3,'String','[empty]','Fontsize',8)
        set(pb4,'String','[empty]','Fontsize',8)
        set(pb5,'String','[empty]','Fontsize',8)
        set(pb6,'String','[empty]','Fontsize',8)
        set(pb7,'String','[empty]','Fontsize',8)
        set(pb8,'String','[empty]','Fontsize',8)
        set(pb9,'String','[empty]','Fontsize',8)
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
    set(pb1,'String','O','Fontsize',14) %updates each cooreponding button if the statement is TRUE
    
end
if board(2,1)==2
    set(pb2,'String','O','Fontsize',14)
    
end
if board(3,1)==2
    set(pb3,'String','O','Fontsize',14)
    
end
if board(1,2)==2
    set(pb4,'String','O','Fontsize',14)
    
end
if board(2,2)==2
    set(pb5,'String','O','Fontsize',14)
    
end
if board(3,2)==2
    set(pb6,'String','O','Fontsize',14)
    
end
if board(1,3)==2
    set(pb7,'String','O','Fontsize',14)
    
end
if board(2,3)==2
    set(pb8,'String','O','Fontsize',14)
    
end
if board(3,3)==2
    set(pb9,'String','O','Fontsize',14)
    
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
    set(src,'Str','X','Fontsize',14)
    set(src,'Foregroundcolor','[0.9290 0.6940 0.1250]')
    win_scan()
    compMove(isfirstmove)
    win_scan()
    CompMoveScan()
    %board % only displayed for testing and presentation purposes
    
end

end

function brd_playBOne(src,event)
global board;
global isfirstmove;
global winr;
%this if statment scans if the move is legal/ if a win condition is met
%then it will run the computer move if the player has not played there
if legality_scanner(2,1)
    set(src,'Str','X','Fontsize',14)
    set(src,'Foregroundcolor','[0.9290 0.6940 0.1250]')
    win_scan()
    compMove(isfirstmove)
    win_scan()
    CompMoveScan()
    %board
end
end

function brd_playCOne(src,event)
global board;
global isfirstmove;
global winr;
%this if statment scans if the move is legal/ if a win condition is met
%then it will run the computer move if the player has not played there
if legality_scanner(3,1)
    set(src,'Str','X','Fontsize',14)
    set(src,'Foregroundcolor','[0.9290 0.6940 0.1250]')
    win_scan()
    compMove(isfirstmove)
    win_scan()
    CompMoveScan()
    %board
end
end

function brd_playATwo(src,event)
global board;
global isfirstmove;
global winr;
%this if statment scans if the move is legal/ if a win condition is met
%then it will run the computer move if the player has not played there
if legality_scanner(1,2)
    set(src,'Str','X','Fontsize',14)
    set(src,'Foregroundcolor','[0.9290 0.6940 0.1250]')
    win_scan()
    compMove(isfirstmove)
    win_scan()
    CompMoveScan()
    %board
end
end

function brd_playBTwo(src,event)
global board;
global isfirstmove;
global winr;
%this if statment scans if the move is legal/ if a win condition is met
%then it will run the computer move if the player has not played there
if legality_scanner(2,2)
    set(src,'Str','X','Fontsize',14)
    set(src,'Foregroundcolor','[0.9290 0.6940 0.1250]')
    win_scan()
    compMove(isfirstmove)
    win_scan()
    CompMoveScan()
    % board
end
end

function brd_playCTwo(src,event)
global board;
global isfirstmove;
global winr;
%this if statment scans if the move is legal/ if a win condition is met
%then it will run the computer move if the player has not played there
if legality_scanner(3,2)
    set(src,'Str','X','Fontsize',14)
    set(src,'Foregroundcolor','[0.9290 0.6940 0.1250]')
    win_scan()
    compMove(isfirstmove)
    win_scan()
    CompMoveScan()
    % board
end
end

function brd_playAThree(src,event)
global board;
global isfirstmove;
global winr;
%this if statment scans if the move is legal/ if a win condition is met
%then it will run the computer move if the player has not played there
if legality_scanner(1,3)
    set(src,'Str','X','Fontsize',14)
    set(src,'Foregroundcolor','[0.9290 0.6940 0.1250]')
    win_scan()
    compMove(isfirstmove)
    win_scan()
    CompMoveScan()
    %board
end
end

function brd_playBThree(src,event)
global board;
global isfirstmove;
global winr;
%this if statment scans if the move is legal/ if a win condition is met
%then it will run the computer move if the player has not played there
if legality_scanner(2,3)
    set(src,'Str','X','Fontsize',14)
    set(src,'Foregroundcolor','[0.9290 0.6940 0.1250]')
    win_scan()
    compMove(isfirstmove)
    win_scan()
    CompMoveScan()
    %board
end
end

function brd_playCThree(src,event)
global board;
global isfirstmove;
global winr;
%this if statment scans if the move is legal/ if a win condition is met
%then it will run the computer move if the player has not played there
if legality_scanner(3,3)
    set(src,'Str','X','Fontsize',14)
    set(src,'Foregroundcolor','[0.9290 0.6940 0.1250]')
    win_scan()
    compMove(isfirstmove)
    win_scan()
    CompMoveScan()
    % board
end
end