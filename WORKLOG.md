# Work Log
Group Name: Oursweeper
Members: Alvin He, Eric Liu

## GROUP MEMBER 1
Alvin He
### date 5/22
in class: created classes and started to put in methods according to the prototype
at home: started filling in basic setup functions
### date 5/23
in class: combined the bomb and safe class into one square class and created methods usable for just one class
at home: initialized a board with randomly placed bombs and began working on squares bomb methods
### date 5/24
in class: got a method working that randomly places bombs and shows reveal the bomb locations
at home: made the revealMines method toggle-able on the keybind R. it now reveals the mines when you hold R,
fixed checkerboard Board pattern
### date 5/25
in class: fixed reveal mines, worked on a flag method, and began printBoard();
at home: got the flag system to fully work with the reveal method. added a flag counter and removes flag when right clicks existing flags;
### date 5/26
in class: got colors shift working for the flag counter, fixed the flag counter protocol when flagsLeft = 0, started working on digSquare();
at home: got dig working for one square and started an endGame method; set up methods carve methods and outlined how it should be implemented;
### date 5/30
in class: discussed with Eric how to implement carve and helped him implement in on his computer;
at home: worked on endGame() method and allowed for a reset game after losing/winning by pressing 'enter', implemented the changes we made in class;
got the carve method fully working for squares = 0;
### date 5/31
in class: worked on the initial carve;
at home: got the first carve working and redid how the bombs were placed initially to accommodate, started working on a medium difficulty, added timer and win sequence;
### date 6/1
at home: fixed the timer;
### date 6/5
at home: fixed the sizing issues for SIZE and board;
### date 6/6
in class: worked on a medium and a hard difficulty and adjusted board sizings to fit;
at home: made menus branch and implemented Eric's start menu with buttons;
### date 6/6
in class: discussed new approach to the menus, decided to have pop-ups rather than full end/win screens; create a high score keeper
at home: implemented high score function;
### date 6/9
in class: fixed high score function that was deleted, adjusted the prototype, made different high scores for each difficulty;
at home: fixed score tracker post-game,
### date 6/10
at home:  worked on README.md file and fixed updated prototype;

## GROUP MEMBER 2
Eric Liu
### date 5/22
in class: created the visual board representation for easy mode
at home: created basic methods needed
### date 5/23
in class: removed safe and bomb class by merging into squares class
at home: worked on squares class, get/class/other methods
### date 5/24
in class: started working on sumSquare to calculate the number of mines around a square
at home: added the checkSquares helper method
### date 5/25
in class: created a method to show the value of safe squares, made a better version of setting mines that will always make the difficulty's amount
at home: refined the checkSquares since values shown were not consistent to what they should be
### date 5/26
in class: removed zeroes from showing on the board and the purpose of the board is to store values while field stores dig-able squares and undig-able squares
### date 5/29
at home: started the carve method, stuck due to a recursion overflow, created turns for the case you want to start carve over dig and committed onto a separate branch called "carve"
### date 5/30
in class: discussed with Alvin about implementing carve, suggested adding a new characteristic to the squares to check if it has been dug or not
at home: merged the branches and tested Alvin's code, took note of possible bad behaviors
### date 5/31
in class: since first carve had bad behavior, suggested it to instead remove the bomb if clicked and place it elsewhere, also made sure that no bombs appear in the 8 squares around
### date 6/1
at home: extensively tested to try to break, resolved some errors include the functioning of flag on dug squares and non-bomb squares. deleted unused private variables and explode() method from squares. made it to where the squares turn blue upon victory
### date 6/6
in class: created a menu page for the player to select their desired difficulty
### date 6/7
in class: started creating a pop-up button for when the game ends
### date 6/8
at home: finished pop-up for when the player wins/loses and the ability to remove it, added play again and return to menu buttons on the pop-up
### date 6/10
at home: finished rules when the player clicks on Minesweeper button during the start




DEV LOG
Working  Features
## A Starting Menu with the rules of Minesweeper and options to choose the difficulty level: Easy, Medium, Hard
  - Easy (DIFFICULTY = 1): 8x10 board, 10 mines
  - Medium (DIFFICULTY = 2): 16x20 board, 40 mines
  - Hard (DIFFICULTY = 3): 20x25 board, 100 mines
## A Flag Method to mark squares the player believes to be mines
  - Right-click unmarked squares to flag, and right-click flagged squares to unflag
  - Limited flags according to the number of mines placed on the board (easy has 10, medium has 40, hard has 100)
## A flag counter in the top left that gradually shifts color from green to red as flags are being placed
  - A Dig Method to dig unrevealed squares the player believes to be safe
  - Left-click unmarked unrevealed squares to dig and reveal if it is a safe square or a mine
## A Carve Method to dig safe squares that have zero mines nearby
  - Utilizes recursion and the tree-burning lab function to clear out a portion of the board with 0 bombs nearby
  - The first move of the game will always be a carve to ensure that the player has something to start off with
## A board set up with mine placements according to where the player makes the first move
  - The first dig will always be a carve with at least 3x3 squares revealed to let the player have options
## A Game Counter located in the top right corner keeping track of how many games was played starting from when the program was ran
## A timer located in the top right corner keeping track of how many minutes and seconds have passed since the first dig/carve was made by the player
  - Later gets converted into the score in seconds
## A scoring system based on how long it took to win/lose
  - The scoring system is based on the number of total seconds the game was
## A High score system recording the lowest time it took to win
  - Each difficulty has their own high score being kept track of
  - Always displayed whether win or lose but only recorded when win
## Win/Lose popups to notify the player that they have won/lost
  - Win pops up when all safe squares are dug, lose pops up when a mine is dug
  - Has a ‘replay’ button to replay the same difficulty
  - Has a ‘return to menu’ button to return to menu and change difficulty
## Rules to let the player know how the game is played
  - Click the Minesweeper button in the main menu
## Keybinds: Press ‘R’  to reveal mines, ‘E’ to reveal safe squares with bombs near, and ‘BACKSPACE’  to return to the menu

Broken features/bugs
- When the game lasts over 99 minutes, the timer in the top right gets shifted slightly off the board
- The score will be slightly off the board if it is greater than 999

List any content resources you used that you found helpful
## We used Google’s Minesweeper as the base of our rendition of Minesweeper:
  - The same controls, scoring system, and number of mines, rows, & columns
