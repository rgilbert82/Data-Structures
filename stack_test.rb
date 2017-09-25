require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'stack'

class StackStructureTest < Minitest::Test
  def setup
    @stack = StackStructure.new
  end

  def test_initialize
    assert_equal @stack.data, []
  end

  def test_push
    @stack.push('hello')
    assert_equal @stack[0], 'hello'
  end

  def test_pop
    @stack.push('one')
    @stack.push('goodbye')
    assert_equal @stack.pop, 'goodbye'
    assert_equal @stack.size, 1
  end

  def test_unshift_return_value
    @stack.push('one')
    assert_equal @stack.unshift('two'), 'two'
  end

  def test_unshift
    @stack.push('one')
    @stack.unshift('two')
    assert_equal @stack[0], 'two'
    assert_equal @stack.length, 2
  end

  def test_shift_return_value
    @stack.push('one')
    @stack.push('two')
    assert_equal @stack.shift, 'one'
  end

  def test_shift
    @stack.push('one')
    @stack.push('two')
    @stack.shift
    assert_equal @stack[0], 'two'
    assert_equal @stack.size, 1
  end

  def test_init_values
    @stack2 = StackStructure.new(['one', 'two', 'three'])
    assert_equal @stack2.data, ['one', 'two', 'three']
  end
end
