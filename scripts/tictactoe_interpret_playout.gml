///tictactoe_interpret_playout(node, playout)
// This takes a playout result (-1 = X wins, 0 = draw, 1 = O wins) and interprets it as a numeric reward in context of the player leading up to this node (-1 = I lose, 0 = We draw, 1 = I win)
// In a 2-player game, this player is always the opponent of the player about to make a move. With more than 2 players, it is advisable to track the previous player in the state.
// It's crucial to do this from the viewpoint of the right player. A bug here will result in "ostrich" behaviour (i.e. assuming that the opponent will always make mistakes)
{
  var node = argument0,
      playout = argument1,
      state = tictactoe_deserialize(node[@MCTS_NODE.STATE]);
  return -state[9]*playout;
}
