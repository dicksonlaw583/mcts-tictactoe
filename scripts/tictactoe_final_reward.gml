///tictactoe_final_reward(state)
{
  var state = argument0;
  // Rows
  if (state[@ 0] == state[@ 1] && state[@ 0] == state[@ 2] && state[@ 0] != 0) {
    return state[@ 0] == 1;
  }
  if (state[@ 3] == state[@ 4] && state[@ 3] == state[@ 5] && state[@ 3] != 0) {
    return state[@ 3] == 1;
  }
  if (state[@ 6] == state[@ 7] && state[@ 6] == state[@ 8] && state[@ 6] != 0) {
    return state[@ 6] == 1;
  }
  // Columns
  if (state[@ 0] == state[@ 3] && state[@ 0] == state[@ 6] && state[@ 0] != 0) {
    return state[@ 0] == 1;
  }
  if (state[@ 1] == state[@ 4] && state[@ 1] == state[@ 7] && state[@ 1] != 0) {
    return state[@ 1] == 1;
  }
  if (state[@ 2] == state[@ 5] && state[@ 2] == state[@ 8] && state[@ 2] != 0) {
    return state[@ 2] == 1;
  }
  // Diagonals
  if (state[@ 0] == state[@ 4] && state[@ 0] == state[@ 8] && state[@ 0] != 0) {
    return state[@ 0] == 1;
  }
  if (state[@ 2] == state[@ 4] && state[@ 2] == state[@ 6] && state[@ 2] != 0) {
    return state[@ 2] == 1;
  }
  // Non-final if any square is blank
  for (var i = 0; i < 9; i++) {
    if (state[@ i] == 0) {
      return undefined;
    }
  }
  // No squares blank and no wins, draw
  return 0.5; 
}
