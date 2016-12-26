///tictactoe_generate_state(perspective)
{
  var state;
  // This is a complete-information game, the perspective IS the state
  for (var i = 9; i >= 0; i--) {
    state[i] = argument0[@ i];
  }
  // Return state
  return state;
}
