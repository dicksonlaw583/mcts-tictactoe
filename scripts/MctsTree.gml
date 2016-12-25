///MctsTree(mcts_type, perspective, scr_select, scr_expand, scr_playout, scr_tentative_reward, scr_reweight, scr_interpret_reward)
enum MCTS_TREE {
  ROOT,
  GENERATE_STATE,
  GENERATE_MOVES,
  APPLY_MOVE,
  FINAL_REWARD,
  SERIALIZE,
  DESERIALIZE,
  SELECT,
  EXPAND,
  PLAYOUT,
  TENTATIVE_REWARD,
  REWEIGHT,
  CLEANUP,
  INTERPRET_REWARD
}

{
  var mcts_tree;
  mcts_tree[MCTS_TREE.INTERPRET_REWARD] = argument7;
  mcts_tree[MCTS_TREE.CLEANUP] = argument0[@MCTS_TYPE.CLEANUP];
  mcts_tree[MCTS_TREE.REWEIGHT] = argument6;
  mcts_tree[MCTS_TREE.TENTATIVE_REWARD] = argument5;
  mcts_tree[MCTS_TREE.PLAYOUT] = argument4;
  mcts_tree[MCTS_TREE.EXPAND] = argument3;
  mcts_tree[MCTS_TREE.SELECT] = argument2;
  mcts_tree[MCTS_TREE.DESERIALIZE] = argument0[@MCTS_TYPE.DESERIALIZE];
  mcts_tree[MCTS_TREE.SERIALIZE] = argument0[@MCTS_TYPE.SERIALIZE];
  mcts_tree[MCTS_TREE.FINAL_REWARD] = argument0[@MCTS_TYPE.FINAL_REWARD];
  mcts_tree[MCTS_TREE.APPLY_MOVE] = argument0[@MCTS_TYPE.APPLY_MOVE];
  mcts_tree[MCTS_TREE.GENERATE_MOVES] = argument0[@MCTS_TYPE.GENERATE_MOVES];
  mcts_tree[MCTS_TREE.GENERATE_STATE] = argument0[@MCTS_TYPE.GENERATE_STATE];
  mcts_tree[MCTS_TREE.ROOT] = MctsNode(script_execute(argument0[@MCTS_TYPE.SERIALIZE], script_execute(argument0[@MCTS_TYPE.GENERATE_STATE], argument1)), 0, 0, undefined, undefined, undefined);
  return mcts_tree;
}
