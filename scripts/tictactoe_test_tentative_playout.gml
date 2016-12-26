///tictactoe_test_tentative_playout()
{
  var state, expected, got;
  
  //Should just return 0 for just about any board
  state = Array(0, 0, 0, 0, 0, 0, 0, 0, 0, -1);
  expected = 0;
  got = tictactoe_tentative_playout(state);
  assert_equal(got, expected, "Tentative reward isn't 0");
}
