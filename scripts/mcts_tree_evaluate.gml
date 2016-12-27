///mcts_tree_evaluate(@mcts_tree, max_playout_ms, max_total_ms)
// Here we grow the given MctsTree for <max_total_ms> milliseconds.
// max_playout_ms is the maximum number of milliseconds to spend on one playout. Upon timeout, the tentative playout script for the tree is called.
// This follows the standard 4-step procedure for MCTS: Select => Expand => Playout => Back-Propagation
{
  var tree = argument0,
      max_playout_ms = argument1,
      max_total_ms = argument2,
      node_root = tree[@MCTS_TREE.ROOT];
  var path, path_size, selection, node, last_node, play_node, play_state, playout_result, moves;
  var start_time = current_time;
  
  do {
    // Select (1): Use the provided selection strategy to dig down the tree for a node to expand.
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
    // Expand (2): Use the provided expansion strategy to return a node to expand.
    last_node = path[@ path[@ 0]];
    play_node = script_execute(tree[@MCTS_TREE.EXPAND], last_node);
    // Playout (3): Determine a result from the expanded node's state.
    // The node to expand is a final node: Use the final playout strategy to determine its result.
    if (is_undefined(play_node)) {
      play_node = last_node;
      play_state = script_execute(tree[@MCTS_TREE.DESERIALIZE], play_node[@MCTS_NODE.STATE]);
      playout_result = script_execute(tree[@MCTS_TREE.FINAL_PLAYOUT], play_state);
    }
    // The node to expand is not a final node: Create an experimental play state and use the playout strategy to determine its result.
    else {
      path[@ 0]++;
      path[@ path[@ 0]] = play_node;
      play_state = script_execute(tree[@MCTS_TREE.DESERIALIZE], play_node[@MCTS_NODE.STATE]);
      playout_result = script_execute(tree[@MCTS_TREE.PLAYOUT], play_state, max_playout_ms);
      // The playout timed out: Use the tentative playout strategy instead to determine a quick result.
      if (is_undefined(playout_result)) {
        playout_result = script_execute(tree[@MCTS_TREE.TENTATIVE_PLAYOUT], play_state);
      }
    }
    // Back-propagation (4): For each node along the path from the expanded node to the root, increment its visit count and the reward given by the playout interpreter
    // IMPORTANT: The reward is from the perspective of the player leading to the current node, not the player about to make a move!
    for (var i = path[@ 0]; i >= 1; i--) {
      node = path[@ i];
      node[@MCTS_NODE.VISITS]++;
      node[@MCTS_NODE.TOTAL] += script_execute(tree[@MCTS_TREE.INTERPRET_PLAYOUT], node, playout_result);
    }
    // Reweight: Use this to recalculate the weighting of each node and update any information that requires bubbling down from the top (e.g. UCT's parent visit count)
    for (var i = 1; i <= path[@ 0]; i++) {
      node = path[@ i];
      script_execute(tree[@MCTS_TREE.REWEIGHT], node, playout_result);
    }
    // Cleanup: Call the cleanup strategy of the tree to free resources allocated to the experimental play state.
    // This is necessary only if the live state uses dynamically allocated resources that need manual freeing, e.g. ds_* data structures
    if (!is_undefined(tree[@MCTS_TREE.CLEANUP])) {
      script_execute(tree[@MCTS_TREE.CLEANUP], play_state);
    }
  } until (current_time - start_time >= max_total_ms) // Do it until timeout
}
