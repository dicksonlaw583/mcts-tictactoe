///MctsType(scr_generate_state, scr_generate_moves, scr_apply_move, scr_final_playout, scr_serialize, scr_deserialize, scr_cleanup)
// This defines the basic rules of the game, containing only absolute facts and elementary operations. No strategic elements should be present here (save those for MctsTree).
// MctsTree will copy scripts off this upon setup.
enum MCTS_TYPE {
  GENERATE_STATE, //xxx_generate_state(perspective): The script for generating a state from a given perspective
  GENERATE_MOVES, //xxx_generate_moves(state): The script for generating moves from a given state, in [<# of moves>, <move A>, <move B>, ...] array form ([0, undefined] for no moves)
  APPLY_MOVE, //xxx_apply_move(@state, move): The script for applying a move in-place to the provided state
  FINAL_PLAYOUT, //xxx_final_playout(state): The script for returing a final playout result from a provided state (undefined if it isn't final)
  SERIALIZE, //xxx_serialize(state): The script for converting the provided state to a serialized format
  DESERIALIZE, //xxx_deserialize(statestr): The script for converting a provided serialized state to a live state
  CLEANUP, //xxx_cleanup(@state): The script for freeing resources used by a given live state (can be set to undefined if not needed)
}

{
  var mcts_type;
  mcts_type[MCTS_TYPE.CLEANUP] = argument6;
  mcts_type[MCTS_TYPE.DESERIALIZE] = argument5;
  mcts_type[MCTS_TYPE.SERIALIZE] = argument4;
  mcts_type[MCTS_TYPE.FINAL_PLAYOUT] = argument3;
  mcts_type[MCTS_TYPE.APPLY_MOVE] = argument2;
  mcts_type[MCTS_TYPE.GENERATE_MOVES] = argument1;
  mcts_type[MCTS_TYPE.GENERATE_STATE] = argument0;
  return mcts_type;
}
