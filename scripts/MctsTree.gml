///MctsTree(mcts_type, perspective, scr_select, scr_expand, scr_playout, scr_tentative_playout, scr_reweight, scr_interpret_playout)
// This is an expanded version of MctsType, containing strategic elements of the AI. This is what an AI would operate on.
enum MCTS_TREE {
  ROOT, //The root node (MctsNode)
  GENERATE_STATE, //(Inherited from MctsType) xxx_generate_state(perspective): The script for generating a state from a given perspective
  GENERATE_MOVES, //(Inherited from MctsType) xxx_generate_moves(state): The script for generating moves from a given state, in [<# of moves>, <move A>, <move B>, ...] array form ([0, undefined] for no moves)
  APPLY_MOVE, //(Inherited from MctsType) xxx_apply_move(@state, move): The script for applying a move in-place to the provided state
  FINAL_PLAYOUT, //(Inherited from MctsType) xxx_final_playout(state): The script for returing a final playout result from a provided state (undefined if it isn't final)
  SERIALIZE, //(Inherited from MctsType) xxx_serialize(state): The script for converting the provided state to a serialized format
  DESERIALIZE, //(Inherited from MctsType) xxx_deserialize(statestr): The script for converting a provided serialized state to a live state
  SELECT, //xxx_select(node): The script for selecting children of the provided node, in [<move>, <child node>] array form ([undefined, <provided node>] if it can't go further)
  EXPAND, //xxx_expand(node): The script for expanding the given node and returning a node to play out (undefined if it is a final node)
  PLAYOUT, //xxx_playout(@state, max_playout_ms): The script for playing out the given state in-place for up to some amount of time in milliseconds, then returning undefined if it didn't finish or the playout result if it did
  TENTATIVE_PLAYOUT, //xxx_tentative_playout(state): The script for returning a quick tentative result for a live state after a playout times out
  REWEIGHT, //xxx_reweight(@node, playout): The script for reweighting a given node during back-propagation, returning the new weight
  CLEANUP, //(Inherited from MctsType) xxx_cleanup(@state): The script for freeing resources used by a given live state (can be set to undefined if not needed)
  INTERPRET_PLAYOUT //xxx_interpret_playout(node, playout): The script for evaluating a playout result (must support tentative AND final results) and returning a numeric reward for the player leading into the node
}

{
  var mcts_tree;
  mcts_tree[MCTS_TREE.INTERPRET_PLAYOUT] = argument7;
  mcts_tree[MCTS_TREE.CLEANUP] = argument0[@MCTS_TYPE.CLEANUP];
  mcts_tree[MCTS_TREE.REWEIGHT] = argument6;
  mcts_tree[MCTS_TREE.TENTATIVE_PLAYOUT] = argument5;
  mcts_tree[MCTS_TREE.PLAYOUT] = argument4;
  mcts_tree[MCTS_TREE.EXPAND] = argument3;
  mcts_tree[MCTS_TREE.SELECT] = argument2;
  mcts_tree[MCTS_TREE.DESERIALIZE] = argument0[@MCTS_TYPE.DESERIALIZE];
  mcts_tree[MCTS_TREE.SERIALIZE] = argument0[@MCTS_TYPE.SERIALIZE];
  mcts_tree[MCTS_TREE.FINAL_PLAYOUT] = argument0[@MCTS_TYPE.FINAL_PLAYOUT];
  mcts_tree[MCTS_TREE.APPLY_MOVE] = argument0[@MCTS_TYPE.APPLY_MOVE];
  mcts_tree[MCTS_TREE.GENERATE_MOVES] = argument0[@MCTS_TYPE.GENERATE_MOVES];
  mcts_tree[MCTS_TREE.GENERATE_STATE] = argument0[@MCTS_TYPE.GENERATE_STATE];
  mcts_tree[MCTS_TREE.ROOT] = MctsNode(script_execute(argument0[@MCTS_TYPE.SERIALIZE], script_execute(argument0[@MCTS_TYPE.GENERATE_STATE], argument1)), 0, 0, undefined, undefined, undefined);
  return mcts_tree;
}
