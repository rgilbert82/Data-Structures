require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'binary_search_tree'

class BinarySearchTreeTest < Minitest::Test
  def setup
    @tree = BinarySearchTree.new(12)
  end

  def test_insert
    @tree.insert(5)
    @tree.insert(2)
    @tree.insert(20)
    assert_equal @tree.root_node.left.data, 5
    assert_equal @tree.root_node.left.left.data, 2
    assert_equal @tree.root_node.right.data, 20
  end

  def test_search
    @tree.insert(5)
    @tree.insert(2)
    @tree.insert(20)
    assert_equal @tree.search(2).data, 2
    assert_nil @tree.find(100)
  end

  def test_sort
    @tree.insert(2, 6, 4, 8, 7, 22, 19, 3, 14, 7)
    assert_equal @tree.sort, [2, 3, 4, 6, 7, 8, 12, 14, 19, 22]
  end

  def test_delete
    @tree.insert(2, 6, 4, 8, 7, 22, 19, 3, 14)
    @tree.delete(8)
    assert_equal @tree.size, 9
    assert_equal @tree.sort, [2, 3, 4, 6, 7, 12, 14, 19, 22]
  end

  def test_delete_root
    @tree.insert(2, 6, 4, 8, 7, 22, 19, 3, 14)
    @tree.delete(12)
    assert_equal @tree.size, 9
    assert_equal @tree.sort, [2, 3, 4, 6, 7, 8, 14, 19, 22]
  end

  def test_delete_everything
    @tree.delete(12)
    assert_equal @tree.size, 0
    assert_equal @tree.sort, []
  end

  def test_add_new_root
    @tree.delete(12)
    @tree.insert(2, 6, 4, 8, 7, 22, 19, 3, 14, 12)
    assert_equal @tree.size, 10
    assert_equal @tree.sort, [2, 3, 4, 6, 7, 8, 12, 14, 19, 22]
  end

  def test_to_string
    @tree.insert(2, 6, 4, 8, 7, 22, 19, 3, 14, 7)
    assert_equal @tree.to_s, "[2, 3, 4, 6, 7, 8, 12, 14, 19, 22]"
  end

  def test_initialize_multiple_values
    tree2 = BinarySearchTree.new(2, 6, 4, 8, 7, 22, 19, 3, 14, 7)
    assert_equal tree2.size, 9
    assert_equal tree2.sort, [2, 3, 4, 6, 7, 8, 14, 19, 22]
  end
end
