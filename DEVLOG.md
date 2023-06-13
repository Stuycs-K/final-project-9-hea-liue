PERIOD 9
Alvin He, Eric Liu
Group Name: Oursweeper

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
