///tictactoe_test_interpret_playout()
{
  var node, expected, got;
  
  // Should regard a positive win with negative to play as a positive win
  node = MctsNode("OOOXX-X--X", 0, 0, undefined, undefined, 4);
  expected = 1;
  got = tictactoe_interpret_playout(node, 1);
  assert_equal(got, expected, "Should regard a positive win with negative to play as a positive win");
  
  // Should regard a negative win with positive to play as a negative win
  node = MctsNode("XXXOO-O--O", 0, 0, undefined, undefined, 4);
  expected = 1;
  got = tictactoe_interpret_playout(node, -1);
  assert_equal(got, expected, "Should regard a negative win with positive to play as a negative win");
  
  // Should regard a draw with positive to play as a draw
  node = MctsNode("OOXXXOOOXO", 0, 0, undefined, undefined, 4);
  expected = 0;
  got = tictactoe_interpret_playout(node, 0);
  assert_equal(got, expected, "Should regard a draw with positive to play as a draw");
  
  // Should regard a draw with negative to play as a draw
  node = MctsNode("XXOOOXXXOX", 0, 0, undefined, undefined, 4);
  expected = 0;
  got = tictactoe_interpret_playout(node, 0);
  assert_equal(got, expected, "Should regard a draw with negative to play as a draw");
  
  // Should regard a negative win with negative to play as a positive loss
  node = MctsNode("OX-------X", 0, 0, undefined, undefined, 4);
  expected = -1;
  got = tictactoe_interpret_playout(node, -1);
  assert_equal(got, expected, "Should regard a positive win with negative to play as a positive win");
  
  // Should regard a positive win with positive to play as a negative loss
  node = MctsNode("XO-------O", 0, 0, undefined, undefined, 4);
  expected = -1;
  got = tictactoe_interpret_playout(node, 1);
  assert_equal(got, expected, "Should regard a negative win with positive to play as a negative win");
}
