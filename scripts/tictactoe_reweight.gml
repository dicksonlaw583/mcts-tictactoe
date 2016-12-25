///tictactoe_reweight(@node, playout)
{
  var node = argument0,
      playout = argument1,
      new_weight = undefined;
  if (is_undefined(node[@MCTS_NODE.AUX])) {
    node[@MCTS_NODE.AUX] = node[@MCTS_NODE.VISITS];
  }
  if (node[@MCTS_NODE.VISITS] > 0) {
    new_weight = node[@MCTS_NODE.TOTAL]/node[@MCTS_NODE.VISITS] + sqrt(2*ln(node[@MCTS_NODE.AUX])/node[@MCTS_NODE.VISITS]);
    node[@MCTS_NODE.WEIGHT] = new_weight;
  }
  if (!is_undefined(node[@MCTS_NODE.CHILDREN])) {
    var children_array = node[@MCTS_NODE.CHILDREN],
        children_array_count = array_length_1d(children_array),
        child_node;
    for (var i = 0; i < children_array_count; i += 2) {
      child_node = children_array[i+1];
      child_node[@MCTS_NODE.AUX] = node[@MCTS_NODE.VISITS];
      if (child_node[@MCTS_NODE.VISITS] > 0) {
        child_node[@MCTS_NODE.WEIGHT] = child_node[@MCTS_NODE.TOTAL]/child_node[@MCTS_NODE.VISITS] + sqrt(2*ln(child_node[@MCTS_NODE.AUX])/child_node[@MCTS_NODE.VISITS]);
      }
    }
  }
  return new_weight;
}
