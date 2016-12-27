///tictactoe_select(node)
{
  var node = argument0,
      selection, children_array, children_array_length, child, child_weight, best_weight, best_move, best_child;
  children_array = node[@MCTS_NODE.CHILDREN];
  // No expanded children, return undefined move and the original node to signal that there we can't dig any deeper
  if (is_undefined(children_array)) {
    selection[0] = undefined;
    selection[1] = argument0;
    return selection;
  }
  // Children have been expanded, find the one with the highest UCT weight
  else {
    children_array_length = array_length_1d(children_array);
    best_weight = undefined;
    best_move = undefined;
    best_child = undefined;
    for (var i = 0; i < children_array_length; i += 2) {
      child = children_array[i+1];
      child_weight = child[@MCTS_NODE.WEIGHT];
      if (is_undefined(child_weight)) {
        selection[0] = children_array[i];
        selection[1] = child;
        return selection;
      }
      if (is_undefined(best_weight) || child_weight > best_weight) {
        best_weight = child_weight;
        best_move = children_array[i];
        best_child = child;
      }
    }
    // Return the move leading to the child node with highest UCT weight, as well as the child node itself
    selection[0] = best_move;
    selection[1] = best_child;
    return selection;
  }
}
