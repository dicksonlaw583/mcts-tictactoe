///tictactoe_test_reweight()
{
  var expected_tree, expected, got, node;

  //Reweighting a lone node that hasn't been visited
  node = MctsNode("---------X", 0, 0, undefined, undefined, undefined);
  expected_tree = MctsNode("---------X", 0, 0, undefined, undefined, 0);
  expected = undefined;
  got = tictactoe_reweight(node, 0);
  assert_equal(got, expected, "Reweighting a lone unvisited node returned the wrong value!");
  assert_equal(node, expected_tree, "Reweighting a lone unvisited node resulted in a wrong tree!");
  
  //Reweighting a lone node that has been visited
  node = MctsNode("---------X", 1, 1, undefined, undefined, undefined);
  expected_tree = MctsNode("---------X", 1, 1, 1, undefined, 1);
  expected = 1;
  got = tictactoe_reweight(node, 0);
  assert_equalish(got, expected, "Reweighting a lone visited node returned the wrong value!");
  assert_equal(node, expected_tree, "Reweighting a lone visited node resulted in a wrong tree!");
  
  //Reweighting a node with children
  node = MctsNode("---------X", 1, 1, undefined, Array(
    0, MctsNode("X--------O", 1, 1, undefined, undefined, undefined),
    1, MctsNode("-X-------O", 0, 0, undefined, undefined, undefined)
  ), undefined);
  expected_tree = MctsNode("---------X", 1, 1, 1, Array(
    0, MctsNode("X--------O", 1, 1, 1, undefined, 1),
    1, MctsNode("-X-------O", 0, 0, undefined, undefined, 1)
  ), 1);
  expected = 1;
  got = tictactoe_reweight(node, 0);
  assert_equalish(got, expected, "Reweighting a parent visited node returned the wrong value!");
  assert_equal(node, expected_tree, "Reweighting a parent visited node resulted in a wrong tree!");
}
