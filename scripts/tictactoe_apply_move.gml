///tictactoe_apply_move(@state, move)
// Here we make apply a move in-place on the given state, returning whether the move was legal.
// The AI will never make an illegal move if the move generator is properly done, the return value is mainly for handling player input.
{
  var state = argument0,
      move = argument1;
  // Check whether the square is blank, return false if not
  if (move < 0 || move > 8 || state[@ move] != 0) {
    return false;
  }
  // Mark the square
  state[@ move] = state[@ 9];
  // It is now the other player's turn (-1 = X, 1 = O)
  state[@ 9] = -state[@ 9];
  // Move successful
  return true;
}
