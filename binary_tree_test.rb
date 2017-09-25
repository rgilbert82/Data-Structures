require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'binary_tree'

class BinaryTreeNodeTest < Minitest::Test
  def setup
    @left = BinaryTreeNode.new
    @right = BinaryTreeNode.new
    @tree = BinaryTreeNode.new(@left, @right)
  end

  def test_children
    assert @tree.children.include?(@left)
    assert @tree.children.include?(@right)
  end

  def test_get_by_index
    assert_equal @tree[0], @left
    assert_equal @tree[1], @right
  end

  def test_delete_left_child
    @tree.delete_left_child
    assert_equal @tree.children, [nil, @right]
  end

  def test_delete_right_child
    @tree.delete_right_child
    assert_equal @tree.children, [@left, nil]
  end

  def test_clear
    @tree.clear
    assert_nil @tree.left_child
    assert_nil @tree.right_child
    assert_equal @tree.children, [nil, nil]
  end

  def test_child_count
    assert_equal @tree.child_count, 2
  end

  def test_is_leaf?
    assert_equal @tree.is_leaf?, false
    assert_equal @left.is_leaf?, true
    assert_equal @right.is_leaf?, true
  end

  def test_is_root?
    assert_equal @tree.is_root?, true
    assert_equal @left.is_root?, false
    assert_equal @right.is_root?, false
  end

  def test_descendents
    @another_node = BinaryTreeNode.new
    @left.add_left_child(@another_node)
    assert_equal @tree.descendents.size, 3
    assert @tree.descendents.include?(@left)
    assert @tree.descendents.include?(@right)
    assert @tree.descendents.include?(@another_node)
  end

  def test_sibling
    @another_node = BinaryTreeNode.new
    @left.add_left_child(@another_node)
    assert_equal @tree.sibling, nil
    assert_equal @left.sibling, @right
    assert_equal @right.sibling, @left
    assert_equal @another_node.sibling, nil
  end

  def test_add_child
    @another_node = BinaryTreeNode.new
    @tree.delete_left_child
    @tree << @another_node
    assert_equal @tree.children, [@another_node, @right]
  end
end
