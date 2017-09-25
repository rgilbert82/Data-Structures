class BinaryTreeNode
  attr_reader :left_child, :right_child

  def initialize(left_child=nil, right_child=nil)
    @parent = nil
    @left_child = add_left_child(left_child)
    @right_child = add_right_child(right_child)
  end

  def children
    [left_child, right_child]
  end

  def add_left_child(child)
    if child.class == BinaryTreeNode
      child.parent = self
      @left_child = child
    end
  end

  def add_right_child(child)
    if child.class == BinaryTreeNode
      child.parent = self
      @right_child = child
    end
  end

  def add_child(child)
    if @left_child.nil?
      add_left_child(child)
    elsif @right_child.nil?
      add_right_child(child)
    else
      nil
    end
  end

  alias :<< :add_child

  def delete_left_child
    @left_child = nil
  end

  def delete_right_child
    @right_child = nil
  end

  def [] index
    if index == 0 || index == :left
      left_child
    elsif index == 1 || index == :right
      right_child
    end
  end

  def is_leaf?
    @left_child.nil? && @right_child.nil?
  end

  def is_root?
    @parent.nil?
  end

  def child_count
    children.reject { |c| c.nil? }.size
  end

  def descendents
    children.reject { |c| c.nil? }.map { |child| [child, child.descendents] }.flatten
  end

  def sibling
    self.is_root? ? nil : @parent.children.reject { |child| child.nil? || child == self }[0]
  end

  def clear
    delete_left_child
    delete_right_child
  end

  protected

  attr_writer :parent
end
