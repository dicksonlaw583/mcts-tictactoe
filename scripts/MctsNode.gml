///MctsNode(state, visits, total, weight, children, aux)
enum MCTS_NODE {
  STATE,
  VISITS,
  TOTAL,
  WEIGHT,
  CHILDREN,
  AUX
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
