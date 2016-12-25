///MctsType(scr_generate_state, scr_generate_moves, scr_apply_move, scr_final_reward, scr_serialize, scr_deserialize)
enum MCTS_TYPE {
  GENERATE_STATE,
  GENERATE_MOVES,
  APPLY_MOVE,
  FINAL_REWARD,
  SERIALIZE,
  DESERIALIZE
}

{
  var mcts_type;
  mcts_type[MCTS_TYPE.DESERIALIZE] = argument5;
  mcts_type[MCTS_TYPE.SERIALIZE] = argument4;
  mcts_type[MCTS_TYPE.FINAL_REWARD] = argument3;
  mcts_type[MCTS_TYPE.APPLY_MOVE] = argument2;
  mcts_type[MCTS_TYPE.GENERATE_MOVES] = argument1;
  mcts_type[MCTS_TYPE.GENERATE_STATE] = argument0;
  return mcts_type;
}
