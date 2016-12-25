///mcts_tree_evaluate(@mcts_tree, max_playout_ms, max_total_ms)
{
  var tree = argument0,
      max_playout_ms = argument1,
      max_total_ms = argument2,
      node_root = tree[@MCTS_TREE.ROOT];
  var path, path_size, selection, node, last_node, play_node, play_state, playout_result, moves;
  var start_time = current_time;
  
  do {
    // Select
    path = undefined;
    path[0] = 0;
    path_size = 0;
    node = node_root;
    do {
      path[++path_size] = node;
      selection = script_execute(tree[@MCTS_TREE.SELECT], node);
      if (!is_undefined(selection[@ 0])) {
        node = selection[@ 1];
      }
    } until (is_undefined(selection[@ 0]));
    path[0] = path_size;
    // Expand
    last_node = path[@ path[@ 0]];
    play_node = script_execute(tree[@MCTS_TREE.EXPAND], last_node);
    // Playout
    if (is_undefined(play_node)) {
      play_node = last_node;
      play_state = script_execute(tree[@MCTS_TREE.DESERIALIZE], play_node[@MCTS_NODE.STATE]);
      playout_result = script_execute(tree[@MCTS_TREE.FINAL_REWARD], play_state);
    }
    else {
      path[@ 0]++;
      path[@ path[@ 0]] = play_node;
      play_state = script_execute(tree[@MCTS_TREE.DESERIALIZE], play_node[@MCTS_NODE.STATE]);
      playout_result = script_execute(tree[@MCTS_TREE.PLAYOUT], play_state, max_playout_ms);
      if (is_undefined(playout_result)) {
        show_debug_message("ABCD");
        playout_result = script_execute(tree[@MCTS_TREE.TENTATIVE_REWARD], play_state);
      }
    }
    // Bubble
    for (var i = path[@ 0]; i >= 1; i--) {
      node = path[@ i];
      node[@MCTS_NODE.VISITS]++;
    }
    // Reweight
    for (var i = 1; i <= path[@ 0]; i++) {
      node = path[@ i];
      script_execute(tree[@MCTS_TREE.REWEIGHT], node, playout_result);
    }
  } until (current_time - start_time >= max_total_ms)
}
