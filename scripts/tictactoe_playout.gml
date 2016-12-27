///tictactoe_playout(@state, max_playout_ms)
{
  var state = argument0,
      max_playout_ms = argument1,
      start_time = current_time,
      moves;
  
  // Make an in-place playout on the provided state for as long as time allows
  do {
    moves = tictactoe_generate_moves(state);
    // Game decided, return final result
    if (moves[0] == 0) {
      return tictactoe_final_playout(state);
    }
    // Game still ongoing, make random move
    else {
      tictactoe_apply_move(state, moves[irandom_range(1, moves[0])]);
    }
  } until (current_time - start_time >= max_playout_ms)
  
  // Didn't finish playing in time, return undefined to signal this
  // mcts_tree_evaluate() will then call the tentative playout function for more immediate advice
  return undefined;
}
