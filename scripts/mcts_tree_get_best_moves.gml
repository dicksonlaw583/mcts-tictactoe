///mcts_tree_get_best_moves(mcts_tree)
{
  var tree = argument0;
  var sequence, sequence_size, node, selection;
  sequence[0] = 0;
  sequence[1] = undefined;
  sequence_size = 0;
  node = tree[@MCTS_TREE.ROOT];
  do {
    selection = script_execute(tree[@MCTS_TREE.SELECT], node);
    if (!is_undefined(selection[0])) {
      sequence[++sequence_size] = selection[0];
      node = selection[@ 1];
    }
  } until (is_undefined(selection[0]));
  sequence[0] = sequence_size;
  return sequence;
}
