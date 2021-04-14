
clc;clear;
%define vars
global board 
board = zeros(3);


%ones = player = 'X'
%2 = computer = 'O'
for i=1:10
%display board given matrix A
board

%ask for input output matrix A
r = input('row');
c = input('col');
board(r,c) = 1

%check if game over
if win_scan() break; end

%decide next move
compMove(i);

%check if game over
if win_scan() break; end

end