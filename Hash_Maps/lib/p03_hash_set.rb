require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @num_buckets = num_buckets
  end

  def insert(key)
    if @count >= @num_buckets
      resize!
    end
    if !include?(key)
      self[key] << key
      @count += 1
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key)
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    mod = num.hash % @num_buckets
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
