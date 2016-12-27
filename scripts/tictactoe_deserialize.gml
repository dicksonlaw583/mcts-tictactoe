///tictactoe_deserialize(statestr)
// The string format we use uses X for the negative player, - for empty squares and O for the positive player
// The first 9 characters represent the board in row-major order. The last character is the player about to make a move.
// -- Live state
// The live state format is a 10-entry array, with -1 for X, 0 for empty squares and 1 for O.
// The first 9 entries represent the board in row-major order. The last entry is the player about to make a move.
{
  var statestr = argument0,
      state;
  for (var i = 0; i <= 9; i++) {
    switch (string_char_at(statestr, i+1)) {
      case 'X':
        state[i] = -1;
      break;
      case '-':
        state[i] = 0;
      break;
      case 'O':
        state[i] = 1;
      break;
      default:
        show_error("Deserializing invalid state string: " + statestr, true);
      break;
    }
  }
  return state;
}
