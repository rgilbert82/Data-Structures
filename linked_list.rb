class LinkedList
  LLNode = Struct.new(:data, :previous, :next)

  attr_reader :first, :last, :size

  def initialize(*elements)
    @size = 0
    @first = nil
    @last = nil
    self.push(*elements) unless elements.empty?
  end

  alias :length :size

  def empty?
    @size == 0
  end

  def push(*elements)
    elements.each do |el|
      node = LLNode.new(el, @last, nil)
      @first = node if @first.nil?
      @last.next = node unless @last.nil?
      @last = node
      @size += 1
    end
    self
  end

  def pop
    raise "Linked List underflow: nothing to pop." if self.size == 0
    last = @last
    @last = @last.previous
    @size -= 1
    last.data
  end

  alias :<< :push

  def unshift(*elements)
    elements.each do |el|
      node = LLNode.new(el, nil, @first)
      @first.previous = node unless @first.nil?
      @first = node
      @last = node if @last.nil?
      @size += 1
    end
    self
  end

  def shift
    raise "Linked List underflow: nothing to pop." if self.size == 0
    first = @first
    @first = @first.next
    @size -= 1
    first.data
  end

  def [] index
    node = get_node_by_index(index)
    node.nil? ? nil : node.data
  end

  def get_node_by_index index
    current = nil

    if index >= 0
      current = @first
      index.times do
        current = current.nil? ? nil : current.next
      end
    else
      current = @last
      (index.abs - 1).times do
        current = current.nil? ? nil : current.previous
      end
    end

    current
  end

  def []= index, data
    node = get_node_by_index(index)

    if node.nil? && index > 0
      (index - @size).times do
        self.push(nil)
      end
      self.push(data)
      data
    elsif node.nil?
      self.push(data)
      data
    else
      node.data = data
    end
  end

  def insert index, data
    index = self.size + index if index < 0

    if index >= self.size
      self[index] = data
    elsif index <= 0
      self.unshift(data)
    else
      next_node = get_node_by_index(index)
      previous_node = next_node.previous
      new_node = LLNode.new(data, previous_node, next_node)
      previous_node.next = new_node
      next_node.previous = new_node
      @size += 1
      @last = get_node_by_index(@size - 1)
    end
    data
  end

  def delete_at index
    node = get_node_by_index(index)
    return nil if node.nil?

    if node == @first
      @first = node.next
    else
      node.previous.next = node.next
    end

    if node == @last
      @last = node.previous
    else
      node.next.previous = node.previous
    end

    @size -= 1
  end

  def delete value
    deleted = false
    current = @last
    (@size - 1).downto(0) do |idx|
      if self[idx] == value
        self.delete_at(idx)
        deleted = true
      end
    end
    deleted ? value : nil
  end

  def to_a
    result = []
    current = @first
    until current.nil?
      result << current.data
      current = current.next
    end
    result
  end

  def to_s
    self.to_a.to_s
  end

  def each &block
    self.to_a.each(&block)
  end

  def map &block
    self.to_a.map(&block)
  end

  def select &block
    self.to_a.select(&block)
  end

  def reject &block
    self.to_a.reject(&block)
  end

  private

  attr_writer :first, :last, :size
end
