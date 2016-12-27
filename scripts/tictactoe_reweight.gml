///tictactoe_reweight(@node, playout)
// Here we will use the AUX entry of the node to hold the parent node's number of visits (since this MCTS implementation is not doubly linked)
// We can't calculate the UCT weight without it
{
  var node = argument0,
      playout = argument1,
      new_weight = undefined;
  // The number of parent visits hasn't been recorded yet, use its own
  if (is_undefined(node[@MCTS_NODE.AUX])) {
    node[@MCTS_NODE.AUX] = node[@MCTS_NODE.VISITS];
  }
  // Re-calculate UCT if it has been visited before
  if (node[@MCTS_NODE.VISITS] > 0) {
    new_weight = node[@MCTS_NODE.TOTAL]/node[@MCTS_NODE.VISITS] + sqrt(2*ln(node[@MCTS_NODE.AUX])/node[@MCTS_NODE.VISITS]);
    node[@MCTS_NODE.WEIGHT] = new_weight;
  }
  // Do the same with children, recording this node's visit count in their AUX entry
  if (!is_undefined(node[@MCTS_NODE.CHILDREN])) {
    var children_array = node[@MCTS_NODE.CHILDREN],
        children_array_count = array_length_1d(children_array),
        child_node;
    for (var i = 0; i < children_array_count; i += 2) {
      child_node = children_array[i+1];
      child_node[@MCTS_NODE.AUX] = node[@MCTS_NODE.VISITS]; // Inherit parent's visit count
      if (child_node[@MCTS_NODE.VISITS] > 0) {
        child_node[@MCTS_NODE.WEIGHT] = child_node[@MCTS_NODE.TOTAL]/child_node[@MCTS_NODE.VISITS] + sqrt(2*ln(child_node[@MCTS_NODE.AUX])/child_node[@MCTS_NODE.VISITS]);
      }
    }
  }
  // Return the new weight of the node
  return new_weight;
}
