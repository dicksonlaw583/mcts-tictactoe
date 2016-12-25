///Lattice(rows, cols, ...)
{
  var rows = argument[0],
      cols = argument[1],
      q = 2,
      lattice;
  if (argument_count != 2+rows*cols) {
    show_error("Expected " + string(2+rows*cols) + " arguments, got " + string(argument_count) + ".", true);
  }
  for (var i = 0; i < rows; i++) {
    for (var j = 0; j < cols; j++) {
      lattice[i, j] = argument[q++];
    }
  }
  return lattice;
}
