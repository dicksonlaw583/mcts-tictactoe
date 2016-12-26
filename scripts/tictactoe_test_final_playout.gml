///tictactoe_test_final_playout()
{
  var state;
  
  // Positive player (O) win gives 1
  state = Array(-1, 1, 0,
                1, 1, -1,
                -1, 1, 0,
                -1);
  assert_equal(tictactoe_final_playout(state), 1, "Positive player win gives wrong final reward!");
  
  // Negative player (X) win gives -1
  state = Array(-1, 1, -1,
                1, -1, -1,
                -1, 1, 1,
                1);
  assert_equal(tictactoe_final_playout(state), -1, "Negative player win gives wrong final reward!");
  
  // Draw gives 0
  state = Array(-1, 1, 1,
                1, -1, -1,
                1, -1, 1,
                -1);
  assert_equal(tictactoe_final_playout(state), 0, "Draw gives wrong final reward!");
  
  // Non-final state gives undefined
  state = Array(1, 0, 0,
                -1, 0, 0,
                0, 0, 0,
                1);
  assert_isnt_defined(tictactoe_final_playout(state), "Non-final state gave a defined final reward!");
}
