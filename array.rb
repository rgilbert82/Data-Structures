class MyArray
  attr_reader :size
  Element = Struct.new(:data, :prev, :next)

  def initialize(*elements)
    @size = 0
    @first = nil
    @last = nil
    self.push(*elements) unless elements.empty?
  end

  def first
    @first ? @first.data : nil
  end

  def last
    @last ? @last.data : nil
  end

  def push(*elements)
    elements.each do |el|
      new_el = Element.new(el, @last, nil)
      @last.next = new_el unless @last.nil?
      @first = new_el if @first.nil?
      @last = new_el
      @size += 1
    end
    self
  end

  def pop
    return nil if self.size == 0

    @size -= 1
    element = @last
    @last = element.prev
    @last.next = nil unless @last.nil?
    @first = nil if @size == 0
    element.data
  end

  def unshift(*elements)
    elements.each do |el|
      new_el = Element.new(el, nil, @first)
      @first.prev = new_el unless @first.nil?
      @last = new_el if @last.nil?
      @first = new_el
      @size += 1
    end

    self
  end

  def shift
    return nil if self.size == 0

    @size -= 1
    element = @first
    @first = element.next
    @first.prev = nil unless @first.nil?
    @last = nil if @size == 0
    element.data
  end

  def [] idx
    node = get(idx)
    node.nil? ? nil : node.data
  end

  def []= idx, data
    idx = (self.size + idx + 1) if idx < 0
    idx = 0 if idx < 0

    if idx == @size
      self.push(data)
    elsif idx == 0
      self.unshift(data)
    elsif idx > @size
      diff = idx - @size
      diff.times { self.push(nil) }
      self.push(data)
    else
      before = get(idx - 1)
      after = get(idx)
      node = Element.new(data, before, after)
      before.next = node
      after.prev = node
      @size += 1
    end

    data
  end

  alias :<< :push
  alias :insert :[]=
  alias :length :size

  private

  def get idx
    idx = self.size + idx if idx < 0
    return nil if idx >= self.size || idx < 0
    node = @first

    idx.times do |i|
      node = node.next unless node.nil?
    end

    node
  end
end
