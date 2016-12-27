///tictactoe_expand(node)
{
  var node = argument0,
      node_state = tictactoe_deserialize(node[@MCTS_NODE.STATE]),
      moves = tictactoe_generate_moves(node_state);
  // This node is final (no more moves), return undefined to signify that it can't be expanded
  if (moves[0] == 0) {
    return undefined;
  }
  // This node is not final, expand it fully (i.e. one per move) and return the first child.
  // To stop the children from collapsing back into a single value, index 0 is reserved for the size.
  // Example: [2, <move A>, <child A>, <move B>, <child B>]
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
