class MaxIntSet
  attr_reader :max, :store
  
  def initialize(max)
    @max = max
    @store = Array.new(max+1) {false}
  end

  def insert(num)
    if self.is_valid?(num)
      @store[num] = true
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] 
  end

  private

  def is_valid?(num)
    if num > @max || num < 0
      return false
    end
    true
  end

  def validate!(num)
  end
end


class IntSet

  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % @store.length] << num
  end

  def remove(num)
    @store[num % @store.length].delete(num)
  end

  def include?(num)
    @store[num % @store.length].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self.include?(num)
      @count += 1
      @store[num % @store.length] << num
    end
    if @count >= self.num_buckets 
      self.resize!
    end
  end

  def remove(num)
    if self.include?(num)
      @count -= 1
      @store[num % @store.length].delete(num)
    end
  end

  def include?(num)
    @store[num % @store.length].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def re_help
    result = []
    @store.each do |el|
      result += el
    end
    result
  end

  def resize!
    old_store = self.re_help
    new_store = Array.new(@count*2) { Array.new }
    old_store.each do |el|
        new_store[el % new_store.length] << el
    end
    @store = new_store
  end

end
