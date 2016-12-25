///tictactoe_test_expand()
{
  var expected_tree, expected, got, node;
  
  //Test: Expanding empty board
  node = MctsNode("---------O", 0, 0, undefined, undefined, undefined);
  expected_tree = MctsNode("---------O", 0, 0, undefined, Array(
    0, MctsNode("O--------X", 0, 0, undefined, undefined, undefined),
    1, MctsNode("-O-------X", 0, 0, undefined, undefined, undefined),
    2, MctsNode("--O------X", 0, 0, undefined, undefined, undefined),
    3, MctsNode("---O-----X", 0, 0, undefined, undefined, undefined),
    4, MctsNode("----O----X", 0, 0, undefined, undefined, undefined),
    5, MctsNode("-----O---X", 0, 0, undefined, undefined, undefined),
    6, MctsNode("------O--X", 0, 0, undefined, undefined, undefined),
    7, MctsNode("-------O-X", 0, 0, undefined, undefined, undefined),
    8, MctsNode("--------OX", 0, 0, undefined, undefined, undefined)
  ), undefined);
  expected = MctsNode("O--------X", 0, 0, undefined, undefined, undefined);
  got = tictactoe_expand(node);
  assert_equal(got, expected, "Failed to expand empty board!");
  assert_equal(node, expected_tree, "Expanding empty board gave the wrong tree!");
  
  //Test: Expanding finished board
  node = MctsNode("XXOOOXXXOO", 0, 0, undefined, undefined, undefined);
  expected_tree = MctsNode("XXOOOXXXOO", 0, 0, undefined, undefined, undefined);
  expected = undefined;
  got = tictactoe_expand(node);
  assert_equal(got, expected, "Failed to expand done board!");
  assert_equal(node, expected_tree, "Expanding done board gave the wrong tree!");
}
