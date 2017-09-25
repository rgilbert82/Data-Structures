require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'tree'

class TreeNodeTest < Minitest::Test
  def setup
    @tree = TreeNode.new
    @child = TreeNode.new
    @tree.add_child @child
  end

  def test_add_child
    @child2 = TreeNode.new
    @tree.add_child @child2
    assert @tree.children.include? @child2
    assert @child2.parent == @tree
  end

  def test_remove_child
    @tree.remove_child @child
    assert @tree.children.empty?
  end

  def test_child_count
    assert_equal @tree.child_count, 1
  end

  def test_is_leaf
    assert_equal @tree.is_leaf?, false
    assert_equal @child.is_leaf?, true
  end

  def test_is_root
    assert_equal @tree.is_root?, true
    assert_equal @child.is_root?, false
  end

  def test_siblings
    assert_equal @tree.siblings, nil
  end

  def test_siblings_2
    @child2 = TreeNode.new
    @tree << @child2
    assert @child.siblings.include? @child2
  end

  def test_descendents
    assert @tree.descendents.include? @child
    assert_equal @child.descendents, []
  end

  def test_index
    assert_equal @tree[0], @child
  end
end
