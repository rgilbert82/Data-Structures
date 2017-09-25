require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'queue'

class QueueStructureTest < Minitest::Test
  def setup
    @queue = QueueStructure.new('one', 'two', 'three')
  end

  def test_enqueue
    @queue.enqueue('four')
    assert_equal @queue.data, ['one', 'two', 'three', 'four']
  end

  def test_enqueue_return_value
    assert_equal @queue.enqueue('four'), ['one', 'two', 'three', 'four']
  end

  def test_dequeue
    @queue.dequeue
    assert_equal @queue.data, ['two', 'three']
  end

  def test_dequeue_return_value
    assert_equal @queue.dequeue, 'one'
  end

  def test_front_enqueue
    @queue.front_enqueue 'zero'
    assert_equal @queue.data, ['zero', 'one', 'two', 'three']
  end

  def test_front_enqueue_return_value
    assert_equal @queue.front_enqueue('zero'), ['zero', 'one', 'two', 'three']
  end

  def test_back_dequeue
    @queue.back_dequeue
    assert_equal @queue.data, ['one', 'two']
  end

  def test_back_dequeue_return_value
    assert_equal @queue.back_dequeue, 'three'
  end

  def clear
    @queue.clear
    assert_equal @queue.data, []
  end

  def test_queue_index
    assert_equal @queue[0], 'one'
  end

  def test_size
    assert_equal @queue.size, 3
    assert_equal @queue.length, 3
  end

  def test_empty
    assert_equal @queue.empty?, false
  end

  def test_empty_2
    @queue.clear
    assert_equal @queue.empty?, true
  end

  def test_front
    assert_equal @queue.front, 'one'
  end

  def test_back
    assert_equal @queue.back, 'three'
  end
end
