require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'array'

class MyArrayTest < Minitest::Test
  def setup
    @arr = MyArray.new(1, true, 'hello')
  end

  def test_size
    assert_equal @arr.size, 3
    assert_equal @arr.length, 3
  end

  def test_first
    assert_equal @arr.first, 1
  end

  def test_last
    assert_equal @arr.last, 'hello'
  end

  def test_push
    assert_equal @arr << 'Something', @arr
    assert_equal @arr.size, 4
    assert_equal @arr.last, 'Something'
  end

  def test_pop
    assert_equal @arr.pop, 'hello'
    assert_equal @arr.length, 2
    assert_equal @arr.last, true

    assert_equal @arr.pop, true
    assert_equal @arr.length, 1
    assert_equal @arr.last, 1
    assert_equal @arr.first, 1

    assert_equal @arr.pop, 1
    assert_equal @arr.length, 0
    assert_nil @arr.last
    assert_nil @arr.first
    assert_nil @arr.pop
  end

  def test_shift
    assert_equal @arr.shift, 1
    assert_equal @arr.length, 2
    assert_equal @arr.first, true

    assert_equal @arr.shift, true
    assert_equal @arr.length, 1
    assert_equal @arr.first, 'hello'
    assert_equal @arr.last, 'hello'

    assert_equal @arr.shift, 'hello'
    assert_equal @arr.length, 0
    assert_nil @arr.first
    assert_nil @arr.last
    assert_nil @arr.shift
  end

  def test_unshift
    assert_equal @arr.unshift(55, 90), @arr
    assert_equal @arr.size, 5
    assert_equal @arr.first, 90
  end

  def test_index
    assert_equal @arr[0], 1
    assert_equal @arr[1], true
    assert_equal @arr[2], 'hello'
    assert_nil @arr[3]
    assert_equal @arr[-1], 'hello'
    assert_equal @arr[-2], true
    assert_equal @arr[-3], 1
    assert_nil @arr[-4]
  end

  def test_insert
    assert_equal @arr[1] = 'Insert!', 'Insert!'
    assert_equal @arr.size, 4
    assert_equal @arr[4] = 'ZZZ', 'ZZZ'
    assert_equal @arr.size, 5
    assert_equal @arr.last, 'ZZZ'
    assert_equal @arr[-10] = 89, 89
    assert_equal @arr.size, 6
    assert_equal @arr.first, 89
  end

  def test_insert_2
    assert_equal @arr.insert(6, 101), 101
    assert_equal @arr.size, 7
    assert_equal @arr.last, 101
    assert_equal @arr[6], 101
    assert_nil @arr[5]
    assert_nil @arr[4]
    assert_nil @arr[3]
    assert_equal @arr[2], 'hello'
  end
end
