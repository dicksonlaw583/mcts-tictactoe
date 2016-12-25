///tictactoe_playout(@state, max_playout_ms)
{
  var state = argument0,
      max_playout_ms = argument1,
      start_time = current_time,
      moves;
  do {
    moves = tictactoe_generate_moves(state);
    if (moves[0] == 0) {
      return tictactoe_final_reward(state);
    }
    else {
      tictactoe_apply_move(state, moves[irandom_range(1, moves[0])]);
    }
  } until (current_time - start_time >= max_playout_ms)
  return undefined;
}
