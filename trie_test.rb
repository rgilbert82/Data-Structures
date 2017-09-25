require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'trie'

class TrieNodeTest < Minitest::Test
  def setup
    @node = TrieNode.new(nil)
  end

  def test_insert
    assert_equal @node.insert('z').data, 'z'
    assert_equal @node.children.size, 1
  end

  def test_have?
    @node.insert('z')
    assert @node.have?('z')
    assert !@node.have?('a')
  end

  def test_get
    @node.insert('z')
    assert_equal @node.get('z').data, 'z'
    assert !@node.get('a')
  end
end

class TrieTest < Minitest::Test
  def setup
    @trie = Trie.new
  end

  def test_tree_has_root_node
    assert_equal @trie.root.class, TrieNode
  end

  def test_root_node_has_no_data
    assert_nil @trie.root.data
  end

  def test_insert
    @trie.insert('hey')
    char_h = @trie.root.get('h')
    assert char_h
    char_e = char_h.get('e')
    assert char_e
    char_y = char_e.get('y')
    assert char_y
    assert char_y.term
  end

  def test_have?
    @trie.insert('hello')
    assert @trie.have?('hello')
    assert !@trie.have?('hell')
    assert !@trie.have?('bye')
  end
end
