require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'linked_list'

class LinkedListTest < Minitest::Test
  def setup
    @list = LinkedList.new('one', 'two', 'three')
  end

  def test_first_last
    assert_equal @list.first.data, 'one'
    assert_equal @list.last.data, 'three'
  end

  def test_size
    assert_equal @list.size, 3
    assert_equal @list.length, 3
  end

  def test_empty?
    list2 = LinkedList.new
    assert list2.empty?
    assert !@list.empty?
  end

  def test_get_by_index
    assert_equal @list[0], 'one'
    assert_equal @list[1], 'two'
    assert_equal @list[2], 'three'
    assert_nil @list[3]
    assert_nil @list[9]
    assert_equal @list[-1], 'three'
    assert_equal @list[-2], 'two'
    assert_nil @list[-7]
  end

  def test_assign_at_used_index
    @list[1] = 'hello'
    assert_equal @list[0], 'one'
    assert_equal @list[1], 'hello'
    assert_equal @list[2], 'three'
  end

  def test_assign_at_empty_positive_index
    @list[5] = 'hello'
    assert_nil @list[3]
    assert_nil @list[4]
    assert_equal @list[5], 'hello'
  end

  def test_assign_at_new_negative_index
    @list[-7] = 'hello'
    assert_equal @list[3], 'hello'
  end

  def test_insert_between_nodes
    @list.insert(2, 'hello')
    assert_equal @list[0], 'one'
    assert_equal @list[1], 'two'
    assert_equal @list[2], 'hello'
    assert_equal @list[3], 'three'
    assert_equal @list.size, 4
    assert_equal @list.last.data, 'three'
  end

  def test_insert_after_all_nodes
    @list.insert(5, 'hello')
    assert_equal @list[2], 'three'
    assert_nil @list[3]
    assert_nil @list[4]
    assert_equal @list[5], 'hello'
    assert_equal @list.size, 6
    assert_equal @list.last.data, 'hello'
  end

  def test_insert_at_zero
    @list.insert(0, 'hello')
    assert_equal @list[0], 'hello'
    assert_equal @list[1], 'one'
    assert_equal @list[2], 'two'
    assert_equal @list[3], 'three'
    assert_equal @list.size, 4
    assert_equal @list.first.data, 'hello'
  end

  def insert_at_negative_index
    @list.insert(-2, 'hello')
    assert_equal @list[0], 'one'
    assert_equal @list[1], 'two'
    assert_equal @list[2], 'hello'
    assert_equal @list[3], 'three'
    assert_equal @list.size, 4
  end

  def test_push
    @list.push('four')
    assert_equal @list[0], 'one'
    assert_equal @list[1], 'two'
    assert_equal @list[2], 'three'
    assert_equal @list[3], 'four'
    assert_equal @list.size, 4
    assert_equal @list.last.data, 'four'
  end

  def test_pop
    assert_equal @list.pop, 'three'
    assert_equal @list.last.data, 'two'
    assert_equal @list.size, 2
  end

  def test_unshift
    @list.unshift('hello')
    assert_equal @list[0], 'hello'
    assert_equal @list[1], 'one'
    assert_equal @list[2], 'two'
    assert_equal @list[3], 'three'
    assert_equal @list.size, 4
    assert_equal @list.first.data, 'hello'
  end

  def test_shift
    assert_equal @list.shift, 'one'
    assert_equal @list.first.data, 'two'
    assert_equal @list.size, 2
  end

  def test_delete_at_1
    @list.delete_at(0)
    assert_equal @list[0], 'two'
    assert_equal @list[1], 'three'
    assert_equal @list.size, 2
    assert_equal @list.first.data, 'two'
  end

  def test_delete_at_2
    @list.delete_at(2)
    assert_equal @list[0], 'one'
    assert_equal @list[1], 'two'
    assert_equal @list.size, 2
    assert_equal @list.last.data, 'two'
  end

  def test_delete_at_3
    @list.delete_at(1)
    assert_equal @list[0], 'one'
    assert_equal @list[1], 'three'
    assert_equal @list.size, 2
  end

  def test_delete
    @list.push('one')
    @list.delete('one')
    assert_equal @list[0], 'two'
    assert_equal @list[1], 'three'
    assert_equal @list.size, 2
  end

  def test_delete_nonincluded_value
    assert_nil @list.delete('four')
  end

  def test_to_array
    assert_equal @list.to_a, ['one', 'two', 'three']
  end

  def test_to_string
    assert_equal @list.to_s, "[\"one\", \"two\", \"three\"]"
  end

  def test_each
    result = @list.each { |el| el }
    assert_equal result, ['one', 'two', 'three']
  end

  def test_map
    result = @list.map { |el| el.upcase }
    assert_equal result, ['ONE', 'TWO', 'THREE']
  end

  def test_select
    result = @list.select { |el| el != 'two' }
    assert_equal result, ['one', 'three']
  end

  def test_reject
    result = @list.reject { |el| el == 'two' }
    assert_equal result, ['one', 'three']
  end
end
