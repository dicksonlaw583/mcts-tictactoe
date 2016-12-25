///tictactoe_deserialize(statestr)
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
