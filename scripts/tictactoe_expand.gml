///tictactoe_expand(node)
{
  var node = argument0,
      node_state = tictactoe_deserialize(node[@MCTS_NODE.STATE]),
      moves = tictactoe_generate_moves(node_state);
  if (moves[0] == 0) {
    return undefined;
  }
  else {
    var children, new_state;
    for (var i = 1; i <= moves[0]; i++) {
      new_state = tictactoe_deserialize(node[@MCTS_NODE.STATE]);
      tictactoe_apply_move(new_state, moves[i]);
      children[(i-1)*2] = moves[i];
      children[((i-1)*2)+1] = MctsNode(tictactoe_serialize(new_state), 0, 0, undefined, undefined, undefined); 
    }
    node[@MCTS_NODE.CHILDREN] = children;
    return children[@ 1];
  }
}
