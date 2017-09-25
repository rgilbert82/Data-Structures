class QueueStructure
  attr_reader :data

  def initialize(*values)
    @data = []
    values.each { |v| enqueue v }
  end

  def [] index
    @data[index]
  end

  def size
    @data.length
  end

  alias :length :size

  def empty?
    @data.size == 0
  end

  def enqueue item
    @data << item
  end

  def dequeue
    @data.shift
  end

  def front_enqueue item    # for Deque
    @data.unshift item
  end

  def back_dequeue          # for Deque
    @data.pop
  end

  def front
    @data[0]
  end

  def back
    @data[-1]
  end

  def clear
    @data = []
  end
end
