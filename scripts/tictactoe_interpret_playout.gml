///tictactoe_interpret_playout(node, playout)
{
  var node = argument0,
      playout = argument1,
      state = tictactoe_deserialize(node[@MCTS_NODE.STATE]);
  return -state[9]*playout;
}