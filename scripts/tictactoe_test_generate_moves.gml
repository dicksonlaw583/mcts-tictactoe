///tictactoe_test_generate_moves()
{
  var state, got_moves, expected_moves;
  
  // No moves for a win/loss
  state = Array(1, 1, 1,
                0, -1, 0,
                -1, 0, 0,
                -1);
  expected_moves = Array(0, undefined);
  got_moves = tictactoe_generate_moves(state);
  assert_equal(got_moves, expected_moves, "Got moves for a win/loss!");
  
  // No moves during a draw
  state = Array(1, -1, -1,
                -1, 1, 1,
                -1, 1, -1,
                1);
  expected_moves = Array(0, undefined);
  got_moves = tictactoe_generate_moves(state);
  assert_equal(got_moves, expected_moves, "Got moves for a draw!");
  
  // All moves for opening board
  state = Array(0, 0, 0,
                0, 0, 0,
                0, 0, 0,
                1);
  expected_moves = Array(9, 0, 1, 2, 3, 4, 5, 6, 7, 8);
  got_moves = tictactoe_generate_moves(state);
  assert_equal(got_moves[0], expected_moves[0], "Wrong number of moves for opening board!");
  for (var i = 1; i <= expected_moves[0]; i++) {
    assert_contains(got_moves, expected_moves[i], "Can't find the move specified for opening board!");
  }
  
  // Some moves for mid-game board
  state = Array(1, -1, 0,
                -1, 1, 0,
                0, 0, 0,
                -1);
  expected_moves = Array(5, 2, 5, 6, 7, 8);
  got_moves = tictactoe_generate_moves(state);
  assert_equal(got_moves[0], expected_moves[0], "Wrong number of moves for mid-game board!");
  for (var i = 1; i <= expected_moves[0]; i++) {
    assert_contains(got_moves, expected_moves[i], "Can't find the move specified for mid-game board!");
  }
  
  // Some moves for late-game board
  state = Array(1, -1, -1,
                -1, 1, 1,
                -1, 1, 0,
                -1);
  expected_moves = Array(1, 8);
  got_moves = tictactoe_generate_moves(state);
  assert_equal(got_moves[0], expected_moves[0], "Wrong number of moves for late-game board!");
  for (var i = 1; i <= expected_moves[0]; i++) {
    assert_contains(got_moves, expected_moves[i], "Can't find the move specified for late-game board!");
  }
}
