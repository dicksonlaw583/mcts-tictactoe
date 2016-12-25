///tictactoe_generate_moves(state)
{
  var state = argument0;
  var moves;
  moves[0] = 0;
  moves[1] = undefined;
  // No moves possible from a win or loss
  if (!is_undefined(tictactoe_final_reward(state))) {
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
