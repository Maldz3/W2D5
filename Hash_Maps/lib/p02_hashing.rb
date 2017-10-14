class Fixnum
  # Fixnum#hash already implemented for you

end

class Array
  def hash
    sum = 0
    self.each_with_index do |el, idx|
      sum += el.hash * (idx + 1)
    end
    sum * 2
  end
end

class String
  def hash
    sum = 0
    alphabet = ('a'..'z').to_a
    sum += self.length + alphabet.index(self[0].downcase)
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
    sum = 0
    self.each do |key, value|
      sum += key.hash
    end
    sum
  end
end
