///mcts_tree_get_best_move(mcts_tree)
{
  var tree = argument0,
      node = tree[@MCTS_TREE.ROOT],
      children_array = node[@MCTS_NODE.CHILDREN],
      children_array_count = array_length_1d(children_array),
      child_node = undefined,
      child_value = undefined,
      best_move = undefined,
      best_amount = undefined;
  if (!is_undefined(children_array)) {
    for (var i = 0; i < children_array_count; i += 2) {
      child_node = children_array[i+1];
      if (!is_undefined(child_node) && child_node[@MCTS_NODE.VISITS] > 0) {
        child_value = child_node[@MCTS_NODE.VISITS]
        show_debug_message(string(children_array[i]) +  ": " + string(child_node[@MCTS_NODE.TOTAL]) + "/" + string(child_node[@MCTS_NODE.VISITS]));
        if (is_undefined(best_amount) || child_value >= best_amount) {
          best_move = children_array[i];
          best_amount = child_value;
        }
      }
    }
  }
  return best_move;
}
