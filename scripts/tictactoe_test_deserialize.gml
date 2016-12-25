///tictactoe_test_deserialize();
{
  var statestr, got, expected;
  
  //Test 1: Opening board
  expected = Array(0, 0, 0,
                0, 0, 0,
                0, 0, 0,
                1);
  statestr = '---------O';
  got = tictactoe_deserialize(statestr);
  assert_equal(got, expected, "Failed deserialization for opening board!");
  
  //Test 2: Mid-game board
  expected = Array(-1, 0, 1,
                0, -1, 0,
                0, 0, 1,
                -1);
  statestr = 'X-O-X---OX';
  got = tictactoe_deserialize(statestr);
  assert_equal(got, expected, "Failed deserialization for mid-game board!");
  
  //Test 3: End-game board
  expected = Array(-1, 1, 1,
                1, -1, -1,
                -1, 1, 1,
                -1);
  statestr = 'XOOOXXXOOX';
  got = tictactoe_deserialize(statestr);
  assert_equal(got, expected, "Failed deserialization for end-game board!");
}
