# Tic-Tac-Toe_Project
Functions:

>>Tic_Tac_Toe_UI:   This is the central function of the game, and where the actual game is played. All of the pushbuttons and global variables are declared here. 

features:  
  - a pop up user interface for the player to update the game, complete with title and credits
  - restart button to reset the game
  - pushbutton controls that show the current state of the game

>>legality_scanner:  This function is used to first check the players move so that it doesnt overwrite another move, then update the game board accordingly.

features:
   - accurate conditions to police player moves
   - player is locked out after a win condition is met
   - notifies the player if they make an illegal move

>>compMove: a computer opponent that responds to player move by checking for potential wins in the next round of moves, and updating the board to either reach a win or a tie.

features:
-able to scan for possible win conditions up to one round in advance with scan_for_win subfunction
-is not mean i.e does not overwrite player moves like it used to

win_scan: used to determine whether or not somebody has won the game, and will announce if a win condition is true.

>>features:
-checks all possible win conditions each time it is run
-sets up player lockout after win is found
-announces win condition in command window


