///mcts_tree_get_best_moves(mcts_tree)
// This returns an array for the best found move sequence from the tree's root node, according to the number of visits.
// To prevent the array from collapsing with 0 or 1 entries, index 0 is reserved for the size.
// Example: [0, undefined], [1, <move A>], [3, <move A>, <move B>, <move C>]
{
  var tree = argument0;
  var sequence, sequence_size, node;
  var children_array, children_array_count, child_node, child_value, best_move, best_child_node, best_amount;
  sequence[0] = 0;
  sequence[1] = undefined;
  sequence_size = 0;
  node = tree[@MCTS_TREE.ROOT];
  do {
    best_move = undefined;
    best_child_node = undefined;
    best_amount = undefined;
    children_array = node[@MCTS_NODE.CHILDREN];
    if (!is_undefined(children_array)) {
      children_array_count = array_length_1d(children_array);
      for (var i = 0; i < children_array_count; i += 2) {
        child_node = children_array[i+1];
        if (!is_undefined(child_node) && child_node[@MCTS_NODE.VISITS] > 0) {
          child_value = child_node[@MCTS_NODE.VISITS]
          if (is_undefined(best_amount) || child_value >= best_amount) {
            best_move = children_array[i];
            best_child_node = child_node;
            best_amount = child_value;
          }
        }
      } 
    }
    if (!is_undefined(best_child_node)) {
      sequence[++sequence_size] = best_move;
      node = best_child_node;
    }
  } until (is_undefined(best_child_node));
  sequence[0] = sequence_size;
  return sequence;
}
