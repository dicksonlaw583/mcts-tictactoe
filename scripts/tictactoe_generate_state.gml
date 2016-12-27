///tictactoe_generate_state(perspective)
// Here we generate a live game state from a provided perspective (i.e. game state as seen from some player's point of view).
// With perfect-information games, a perspective is itself a valid game state.
// With imperfect-information games, this script should attempt to reconstruct what the current player doesn't know.
// Reminder:
// The live state format is a 10-entry array, with -1 for X, 0 for empty squares and 1 for O.
// The first 9 entries represent the board in row-major order. The last entry is the player about to make a move.
{
  var state;
  // This is a complete-information game, the perspective IS the state
  for (var i = 9; i >= 0; i--) {
    state[i] = argument0[@ i];
  }
  // Return state
  return state;
}
