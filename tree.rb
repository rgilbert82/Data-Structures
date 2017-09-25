class TreeNode
  attr_accessor :data, :parent, :children

  def initialize(data = [], parent = nil)
    @data = data
    @parent = parent
    @children = []

    raise "Parent must be a TreeNode" unless @parent.nil? || @parent.class === TreeNode
  end

  def add_child child
    child.parent = self
    @children << child
  end

  alias :<< :add_child

  def remove_child child
    @children.delete child
  end

  def child_count
    @children.size
  end

  def is_leaf?
    @children.empty?
  end

  def is_root?
    @parent.nil?
  end

  def siblings
    self.is_root? ? nil : @parent.children.reject { |child| child == self }
  end

  def descendents
    @children.map { |child| [child, child.descendents] }.flatten
  end

  def clear
    @children.clear
  end

  def [] index
    @children[index]
  end
end
