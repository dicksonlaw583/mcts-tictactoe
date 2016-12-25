///tictactoe_test()
{
  var start_time = current_time;
  tictactoe_test_generate_state();
  tictactoe_test_generate_moves();
  tictactoe_test_apply_move();
  tictactoe_test_tentative_reward();
  tictactoe_test_final_reward();
  tictactoe_test_serialize();
  tictactoe_test_deserialize();
  tictactoe_test_select();
  tictactoe_test_expand();
  tictactoe_test_reweight();
  tictactoe_test_playout();
  show_debug_message("Tic-tac-toe tests completed in " + string(current_time-start_time) + "ms.");
}
