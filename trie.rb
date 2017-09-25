# also known as Radix Tree or Prefix Tree
# lookup time O(n), or linear


class TrieNode
  attr_reader :data, :children
  attr_accessor :term

  def initialize(data)
    @data = data
    @children = []
    @term = false
  end

  def insert(char)
    return get(char) if have?(char)

    child = TrieNode.new(char)
    @children << child
    child
  end

  def have?(char)
    @children.each do |child|
      return true if child.data == char
    end
    false
  end

  def get(char)
    @children.each do |child|
      return child if child.data == char
    end
    false
  end
end

class Trie
  attr_reader :root

  def initialize
    @root = TrieNode.new(nil)
  end

  def insert(word)
    node = @root
    word.chars.each do |char|
      child = node.insert(char)
      node = child
    end
    node.term = true
  end

  def have?(word)
    node = @root
    word.chars.each do |char|
      return false unless node.have?(char)
      node = node.get(char)
    end
    return node.term == true
  end
end
