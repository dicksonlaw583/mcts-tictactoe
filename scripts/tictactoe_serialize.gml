///tictactoe_serialize(state)
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
