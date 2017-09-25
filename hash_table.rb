# aka Hash Map

class HashTable
  attr_reader :data, :initial_value

  def initialize(initial_value=nil)
    @data = []
    @initial_value = initial_value
  end

  def make_index(key)
    id = key.to_sym.object_id
    id  % 100       # reduce the size of the object id
  end

  def []=(key, value)
    index = make_index(key)
    data[index] ||= []
    data[index] << [key, value]
  end

  alias :insert :[]=

  def [](key)
    index = make_index(key)

    if data[index]
      data[index].each do |key_value|
        if key_value[0] == key
          return key_value[1]
        end
      end
      initial_value
    else
      initial_value
    end
  end

  alias :find :[]
  alias :fetch :[]

  def delete(key)
    index = make_index(key)

    if data[index]
      data[index].each_with_index do |key_value, idx|
        if key_value[0] == key
          value = key_value[1]
          data[index].delete_at(idx)
          return value
        end
      end
    end
    nil
  end

  def keys
    data.reject { |d| d.nil? }.map { |a| a.map { |a2| a2[0] } }.flatten
  end

  def values
    data.reject { |d| d.nil? }.map { |a| a.map { |a2| a2[1] } }.flatten
  end

  def size
    self.keys.size
  end

  alias :length :size

  def clear
    @data = []
  end
end
