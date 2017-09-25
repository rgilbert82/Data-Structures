require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'heap'

class HeapTest < Minitest::Test
  def setup
    @heap = Heap.new(7, 1, 9, 1, 16, 2, 8, 17)
  end

  def test_initialize
    assert_equal @heap.data.class, Array
  end

  def test_size
    assert_equal @heap.size, 8
  end

  def test_clear
    @heap.clear
    assert_equal @heap.size, 0
  end

  def test_max_heapify!
    @heap.max_heapify!
    assert_equal @heap.data, [17, 16, 9, 1, 7, 2, 8, 1]
  end

  def test_sort!
    @heap.sort!
    assert_equal @heap.data, [1, 1, 2, 7, 8, 9, 16, 17]
  end

  def test_sort
    assert_equal @heap.sort, [1, 1, 2, 7, 8, 9, 16, 17]
    assert_equal @heap.data, [17, 16, 9, 1, 7, 2, 8, 1]
  end

  def test_to_string
    assert_equal @heap.to_s, "[17, 16, 9, 1, 7, 2, 8, 1]"
  end

  def test_insert
    @heap.insert(22)
    assert_equal @heap.data, [22, 17, 9, 16, 7, 2, 8, 1, 1]
  end

  def test_delete_at
    @heap.delete_at(1)
    assert_equal @heap.size, 7
    assert_equal @heap.data, [17, 9, 8, 7, 2, 1, 1]
  end

  def test_delete
    @heap.delete(1)
    assert_equal @heap.size, 6
    assert_equal @heap.data, [17, 16, 9, 7, 2, 8]
  end
end
