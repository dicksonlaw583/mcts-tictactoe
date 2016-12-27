///tictactoe_test()
// This is a self-test of the operations used to build and evaluate the MCTS AI.
// Using MCTS allows AI to be constructed from only the rules of the game.
{
  var start_time = current_time;
  tictactoe_test_generate_state();
  tictactoe_test_generate_moves();
  tictactoe_test_apply_move();
  tictactoe_test_tentative_playout();
  tictactoe_test_final_playout();
  tictactoe_test_serialize();
  tictactoe_test_deserialize();
  tictactoe_test_select();
  tictactoe_test_expand();
  tictactoe_test_reweight();
  tictactoe_test_playout();
  tictactoe_test_interpret_playout();
  show_debug_message("Tic-tac-toe tests completed in " + string(current_time-start_time) + "ms.");
}
