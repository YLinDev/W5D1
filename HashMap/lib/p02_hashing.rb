class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return 0.hash if self.empty?
    self.inject do |acc, ele|
      acc += ele.hash
    end
  end
end

class String
  def hash
    result = 0
    self.each_char.with_index do |char, i|
      if i.even?
        result += (char.to_i.hash)
      else
        result -= (char.to_i.hash)
      end
    end
    result
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0
    self.each do |k, v|
      result += k.to_s.to_i.hash + v.to_i.hash
    end
    result
  end
end
