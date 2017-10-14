class MaxIntSet
  def initialize(max)
    @max = max
    @store = []
  end

  def insert(num)
    is_valid?(num)
    if @store.length < @max
      @store << num unless @store.include?(num)
    end
  end

  def remove(num)
    @store.pop()
  end

  def include?(num)
    @store.include?(num)
  end

  private

  def is_valid?(num)
    if num > @max || num < 0
      raise "Out of bounds"
    end
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    mod = num % num_buckets
    if !self[num].include?(num)
      self[num] << num
    end
  end

  def remove(num)
    mod = num % num_buckets
    if self[num].include?(num)
      self[num].delete(num)
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    mod = num % num_buckets
    @store[mod]

  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(num)
    if @count >= @num_buckets
      resize!
    end
    if !include?(num)
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    mod = num % @num_buckets
    @store[mod]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @num_buckets *= 2
    dup_arr = @store.dup
    @store = Array.new(@num_buckets) {Array.new}
    @count = 0 
    dup_arr.each do |bucket|
    bucket.each do |el|
      insert(el)
      end
    end
  end
end
