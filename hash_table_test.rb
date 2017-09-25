require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'hash_table'

class HashTableTest < Minitest::Test
  def setup
    @new_hash = HashTable.new
    @new_hash[:one] = 'uno'
  end

  def test_fetch
    assert_equal @new_hash[:one], 'uno'
  end

  def test_insert
    @new_hash[:two] = 'dos'
    assert_equal @new_hash[:two], 'dos'
  end

  def test_delete_return_value
    assert_equal @new_hash.delete(:one), 'uno'
  end

  def test_delete
    @new_hash.delete(:one)
    assert_nil @new_hash[:one]
    assert_equal @new_hash.size, 0
  end

  def test_keys
    keys = @new_hash.keys
    assert_equal keys.size, 1
    assert keys.include?(:one)
  end

  def test_values
    values = @new_hash.values
    assert_equal values.size, 1
    assert values.include?('uno')
  end

  def test_clear
    @new_hash.clear
    assert_equal @new_hash.length, 0
  end

  def test_initial_value
    new_hash_2 = HashTable.new(3)
    new_hash_2[:addition] += 4
    assert_equal new_hash_2[:addition], 7
  end
end
