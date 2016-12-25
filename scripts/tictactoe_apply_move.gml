///tictactoe_apply_move(@state, move)
{
  var state = argument0,
      move = argument1;
  // Check whether the square is blank, return false if not
  if (move >= 0 && move <= 8 && state[@ move] != 0) {
    return false;
  }
  // Mark the square
  state[@ move] = state[@ 9];
  // Flip the player perspective
  state[@ 9] = -state[@ 9];
  // Move successful
  return true;
}
