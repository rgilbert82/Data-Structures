class Heap
  attr_reader :data

  def initialize(*values)
    @data = values
    max_heapify!
  end

  def sort!
    max_heapify!
    last = size - 1

    while last > 0
      @data[0], @data[last] = @data[last], @data[0]
      last -= 1
      sift!(0, last)
    end
    @data
  end

  def sort
    Heap.new(*@data).sort!
  end

  def max_heapify!
    last_parent_idx = size / 2 - 1
    last_parent_idx.downto(0) do |idx|
      self.sift!(idx, size - 1)
    end
    @data
  end

  def sift!(first, last)
    while first * 2 + 1 <= last
      swap = first
      child1 = first * 2 + 1
      child2 = child1 + 1

      if @data[swap] < @data[child1]
        swap = child1
      end

      if child2 <= last && @data[swap] < @data[child2]
        swap = child2
      end

      if first == swap
        return
      else
        @data[first], @data[swap] = @data[swap], @data[first]
        first = swap
      end
    end
  end

  def insert(value)
    @data.push(value)
    max_heapify!
  end

  def delete_at(idx)
    @data.delete_at(idx)
    max_heapify!
  end

  def delete(value)
    @data.delete(value)
    max_heapify!
  end

  alias :push :insert
  alias :<< :insert

  def size
    @data.size
  end

  alias :length :size

  def clear
    @data.clear
  end

  def to_s
    @data.to_s
  end
end
