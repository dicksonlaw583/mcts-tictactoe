///tictactoe_serialize(state)
// -- Serialized string format
// The string format we use uses X for the negative player, - for empty squares and O for the positive player
// The first 9 characters represent the board in row-major order. The last character is the player about to make a move.
// -- Live state
// The live state format is a 10-entry array, with -1 for X, 0 for empty squares and 1 for O.
// The first 9 entries represent the board in row-major order. The last entry is the player about to make a move.
{
  var state = argument0,
      serialized = '';
  for (var i = 0; i <= 9; i++) {
    switch (state[@ i]) {
      case -1:
        serialized += 'X';
      break;
      case 0:
        serialized += '-';
      break;
      case 1:
        serialized += 'O';
      break;
      default:
        show_error("Attempting to serialize invalid state.", true);
      break;
    }
  }
  return serialized;
}
