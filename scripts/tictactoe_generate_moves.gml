///tictactoe_generate_moves(state)
// Here we generate an array of available moves from the given game state.
// With Tic-Tac-Toe, this is the list of open squares. Here we represent them as row-major index numbers:
//  0 | 1 | 2
// ---+---+---
//  3 | 4 | 5 
// ---+---+---
//  6 | 7 | 8
// To prevent the array from collapsing, we reserve index 0 for the size.
// Examples: [0, undefined] (empty), [8, 0, 1, 2, 3, 5, 6, 7, 8] (all squares open except centre)
{
  var state = argument0;
  var moves;
  moves[0] = 0;
  moves[1] = undefined;
  // No moves possible from a win or loss
  if (!is_undefined(tictactoe_final_playout(state))) {
    return moves;
  }
  // Available moves are blank squares
  for (var i = 0; i < 9; i++) {
    if (state[@ i] == 0) {
      moves[++moves[0]] = i;
    }
  }
  // Done
  return moves;
}
