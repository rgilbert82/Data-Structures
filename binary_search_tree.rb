class BSTNode
  attr_accessor :left, :right, :data, :parent

  def initialize(data=nil)
    @left = nil
    @right = nil
    @parent = parent
    @data = data
  end

  def root?
    !@parent
  end

  def leaf?
    !@left && !@right
  end
end

class BinarySearchTree
  attr_accessor :root_node
  attr_reader :size

  def initialize(*data)
    @size = 0
    @root_node = nil
    insert(*data)
  end

  def insert(*data)
    if @root_node.nil? && data.size > 0
      @root_node = BSTNode.new(data[0])
      @size = 1
      data = data[1..-1]
    end

    if !data.nil? && data.size > 0
      data.each { |d| assign_node(BSTNode.new(d), @root_node) }
    end
  end

  alias :push :insert
  alias :<< :insert

  def search(data)
    return nil if @root_node.nil?
    find_node(data, @root_node)
  end

  alias :find :search

  def sort
    return [] if @root_node.nil?
    traverse(@root_node)
  end

  def delete(data)
    node = search(data)

    return nil if node.nil?

    if node.root?
      replace_root(node)
    else
      replace_child(node)
    end
    @size -= 1
  end

  def to_s
    sort.to_s
  end

  private

  def traverse(node, arr=[])
    return nil if node.nil?

    traverse(node.left, arr)
    arr << node.data
    traverse(node.right, arr)
    arr
  end

  def assign_node(new_node, node, reassign=false)
    return nil if node.nil? || new_node.nil?

    if new_node.data == node.data
      new_node.data
    elsif new_node.data < node.data
      unless node.left
        @size += 1 unless reassign
        node.left = new_node
        new_node.parent = node
      else
        assign_node(new_node, node.left, reassign)
      end
    elsif new_node.data > node.data
      unless node.right
        @size += 1 unless reassign
        node.right = new_node
        new_node.parent = node
      else
        assign_node(new_node, node.right, reassign)
      end
    end
  end

  def find_node(data, node)
    return nil if node.nil?

    if data == node.data
      node
    elsif data < node.data
      find_node(data, node.left)
    elsif data > node.data
      find_node(data, node.right)
    end
  end

  def replace_child(node)
    parent = node.parent

    if node.right.nil?
      new_child = node.left
      leftover_child = nil
    else
      new_child = node.right
      leftover_child = node.left
    end

    if node == parent.left
      parent.left = new_child
    elsif node == parent.right
      parent.right = new_child
    end

    new_child.parent = parent unless new_child.nil?
    assign_node(leftover_child, @root_node, true)
  end

  def replace_root(root)
    if root.right.nil?
      new_root = root.left
      leftover_child = nil
    else
      new_root = root.right
      leftover_child = root.left
    end

    @root_node = new_root
    root_node.parent = nil unless root_node.nil?
    assign_node(leftover_child, @root_node, true)
  end
end
