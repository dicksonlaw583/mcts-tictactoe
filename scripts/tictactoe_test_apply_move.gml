///tictactoe_test_apply_move()
{
  var state, move, expected_state, result;
  
  // Positive player to play, valid move
  state = Array(0, 0, 0,
                0, 0, 0,
                0, 0, 0,
                1);
  move = 2;
  expected_state = Array(0, 0, 1,
                         0, 0, 0,
                         0, 0, 0,
                         -1);
  result = tictactoe_apply_move(state, move);
  assert(result, "Positive player valid move failed!");
  assert_equal(state, expected_state, "Positive player valid move did something unexpected!");
  
  // Positive player to play, invalid move
  state = Array(0, 0, 1,
                -1, 0, 0,
                0, 0, 0,
                1);
  move = 2;
  expected_state = Array(0, 0, 1,
                         -1, 0, 0,
                         0, 0, 0,
                         1);
  result = tictactoe_apply_move(state, move);
  assert_fail(result, "Positive player invalid move succeeded!");
  assert_equal(state, expected_state, "Positive player invalid move did something!");
  
  // Negative player to play, valid move
  state = Array(0, 0, 1,
                0, 0, 0,
                0, 0, 0,
                -1);
  move = 3;
  expected_state = Array(0, 0, 1,
                         -1, 0, 0,
                         0, 0, 0,
                         1);
  result = tictactoe_apply_move(state, move);
  assert(result, "Negative player valid move failed!");
  assert_equal(state, expected_state, "Negative player valid move did something unexpected!");
  
  // Negative player to play, invalid move
  state = Array(0, 0, 1,
                -1, 0, 0,
                0, 0, 0,
                -1);
  move = 2;
  expected_state = Array(0, 0, 1,
                         -1, 0, 0,
                         0, 0, 0,
                         -1);
  result = tictactoe_apply_move(state, move);
  assert_fail(result, "Negative player invalid move succeeded!");
  assert_equal(state, expected_state, "Negative player invalid move did something!");
}
