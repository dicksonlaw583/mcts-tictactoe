///tictactoe_test_serialize()
{
  var state, got, expected;
  
  //Test 1: Opening board
  state = Array(0, 0, 0,
                0, 0, 0,
                0, 0, 0,
                1);
  expected = '---------O';
  got = tictactoe_serialize(state);
  assert_equal(got, expected, "Failed serialization for opening board!");
  
  //Test 2: Mid-game board
  state = Array(-1, 0, 1,
                0, -1, 0,
                0, 0, 1,
                -1);
  expected = 'X-O-X---OX';
  got = tictactoe_serialize(state);
  assert_equal(got, expected, "Failed serialization for mid-game board!");
  
  //Test 3: End-game board
  state = Array(-1, 1, 1,
                1, -1, -1,
                -1, 1, 1,
                -1);
  expected = 'XOOOXXXOOX';
  got = tictactoe_serialize(state);
  assert_equal(got, expected, "Failed serialization for end-game board!");
}
