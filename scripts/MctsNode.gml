///MctsNode(state, visits, total, weight, children, aux)
// This is the basic unit of data storage for MctsTree.
enum MCTS_NODE {
  STATE, //The serialized game state for this node
  VISITS, //The number of times this node has been visited
  TOTAL, //The total cumulative reward for this node
  WEIGHT, //The search weight assigned to this node (e.g. by UCT)
  CHILDREN, //Child MctsNode nodes stored in array form: [<move A>, <child A>, <move B>, <child B>, ...]. Use undefined for no children yet (or at all).
  AUX //Spare storage for any additional information not covered above
}

{
  var mcts_node;
  mcts_node[MCTS_NODE.AUX] = argument5;
  mcts_node[MCTS_NODE.CHILDREN] = argument4;
  mcts_node[MCTS_NODE.WEIGHT] = argument3;
  mcts_node[MCTS_NODE.TOTAL] = argument2;
  mcts_node[MCTS_NODE.VISITS] = argument1;
  mcts_node[MCTS_NODE.STATE] = argument0;
  return mcts_node;
}
