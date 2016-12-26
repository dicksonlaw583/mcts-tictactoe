///tictactoe_test_generate_state()
{
  var perspective, expected_state;
  
  // Positive player (O) to play
  perspective = Array(1, 0, 0, -1, 0, 0, 0, 0, 0, 1);
  expected_state = Array(1, 0, 0, -1, 0, 0, 0, 0, 0, 1);
  assert_equal(tictactoe_generate_state(perspective), expected_state, "Positive state generation failed!");
  
  // Negative player (X) to play
  perspective = Array(1, 0, 0, -1, 0, 0, 0, 0, 0, -1);
  expected_state = Array(1, 0, 0, -1, 0, 0, 0, 0, 0, -1);
  assert_equal(tictactoe_generate_state(perspective), expected_state, "Negative state generation failed!");
}
