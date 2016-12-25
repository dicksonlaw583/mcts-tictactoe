///tictactoe_test_select()
{
  var expected, got, tree;
  
  // Single node without children: pick it with move undefined
  tree = MctsNode("---------X", 0, 0, undefined, undefined, undefined);
  expected = Array(undefined, tree);
  got = tictactoe_select(tree);
  assert_equal(got, expected, "Failed to select lone node!");
  
  // Single node with an undefined-weight child: pick it with the correct move
  tree = MctsNode("---------X", 0, 0, undefined, Array(
    0, MctsNode("X--------O", 1, 1, 5, undefined, undefined),
    1, MctsNode("-X-------O", 0, 1, 2, undefined, undefined),
    4, MctsNode("----X----O", 1, 1, undefined, undefined, undefined)
  ), undefined);
  expected = Array(4, MctsNode("----X----O", 1, 1, undefined, undefined, undefined));
  got = tictactoe_select(tree);
  assert_equal(got, expected, "Failed to select undefined-weight child!");
  
  // Single node with children all weighted: pick it with the correct move
  tree = MctsNode("---------X", 0, 0, undefined, Array(
    1, MctsNode("-X-------O", 0, 1, 2, undefined, undefined),
    0, MctsNode("X--------O", 2, 2, 5, undefined, undefined),
    4, MctsNode("----X----O", 1, 1, 4, undefined, undefined)
  ), undefined);
  expected = Array(0, MctsNode("X--------O", 2, 2, 5, undefined, undefined));
  got = tictactoe_select(tree);
  assert_equal(got, expected, "Failed to select defined-weight child!");
}
