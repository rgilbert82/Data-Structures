class StackStructure
  attr_reader :data

  def initialize(*values)
    @data = []
    @head = -1

    values.flatten.each { |v| push v }
  end

  def push value
    @data << value
    @head += 1
    value
  end

  def pop
    value = @data[@head]
    @data.delete_at @head
    @head -= 1
    value
  end

  def unshift value
    @data = [value].concat(@data)
    @head += 1
    value
  end

  def shift
    value = @data[0]
    @data.delete_at 0
    @head -= 1
    value
  end

  def [] index
    @data[index]
  end

  def size
    @data.length
  end

  alias :length :size

  def to_s
    @data.to_s
  end

  def top
    @data[-1]
  end

  alias :last :top

  def bottom
    @data[0]
  end

  alias :first :bottom

  def clear
    @data = []
  end
end
