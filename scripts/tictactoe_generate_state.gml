///tictactoe_generate_state(perspective)
{
  var state;
  // Positive player to play, make clone of perspective
  if (argument0[@ 9]) {
    for (var i = 9; i >= 0; i--) {
      state[i] = argument0[@ i];
    }
  }
  // Negative player to play, make inverse of perspective
  else {
    for (var i = 9; i >= 0; i--) {
      state[i] = -argument0[@ i];
    }
  }
  // Return state
  return state;
}
