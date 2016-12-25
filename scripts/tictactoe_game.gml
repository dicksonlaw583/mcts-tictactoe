///tictactoe_game()
{
  do {
    var perspective = Array(0, 0, 0, 0, 0, 0, 0, 0, 0, choose(1, -1)),
    player_identity = choose(1, -1),
    mcts_type = MctsType(
      tictactoe_generate_state,
      tictactoe_generate_moves,
      tictactoe_apply_move,
      tictactoe_final_reward,
      tictactoe_serialize,
      tictactoe_deserialize,
      undefined
    );
    var input, outcome, message, mcts_tree, mcts_tree_moves;
    do {
      // Generate board visualization
      message = "";
      for (var i = 0; i < 9; i++) {
        switch (perspective[i]) {
          case -1:
            message += "X ";
          break;
          case 0:
            message += "- ";
          break;
          case 1:
            message += "O ";
          break;
        }
        if (i mod 3 == 2) {
          message += chr(13);
        }
      }
      if (player_identity == 1) {
        message += chr(13) + "You play O. Make your move:";
      }
      else {
        message += chr(13) + "You play X. Make your move:";
      }
      // Player plays
      if (perspective[9] == player_identity) {
        input = get_integer(message, 0);
        if (!tictactoe_apply_move(perspective, input)) {
          show_message("Invalid move.");
        }
      }
      // Computer plays
      else {
        mcts_tree = MctsTree(mcts_type, perspective,
          tictactoe_select,
          tictactoe_expand,
          tictactoe_playout,
          tictactoe_tentative_reward,
          tictactoe_reweight,
          tictactoe_interpret_reward
        );
        mcts_tree_evaluate(mcts_tree, 100, 250);
        tictactoe_apply_move(perspective, mcts_tree_get_best_move(mcts_tree));
        mcts_tree = undefined;
      }
      // Check game end
      outcome = tictactoe_final_reward(perspective);
    } until (!is_undefined(outcome))
    
    // Game end message
    message = "";
    for (var i = 0; i < 9; i++) {
      switch (perspective[i]) {
        case -1:
          message += "X ";
        break;
        case 0:
          message += "- ";
        break;
        case 1:
          message += "O ";
        break;
      }
      if (i mod 3 == 2) {
        message += chr(13);
      }
    }
    if (player_identity == 1) {
      message += chr(13) + "You play O.";
    }
    else {
      message += chr(13) + "You play X.";
    }
    
    if (player_identity == 1) {
      if (outcome == 1) {
        message += chr(13) + "You win!";
      }
      else if (outcome == -1) {
        message += chr(13) + "You lose!";
      }
      else {
        message += chr(13) + "Draw!";
      }
    }
    else {
      if (outcome == 1) {
        message += chr(13) + "You lose!";
      }
      else if (outcome == -1) {
        message += chr(13) + "You win!";
      }
      else {
        message += chr(13) + "Draw!";
      }
    }
    
    show_message(message);
  } until (!show_question("Play again?"))
}
