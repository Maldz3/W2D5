class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove_node
    # optional but useful, connects previous link to next link
    # and removes self from list.
    self.prev.next = self.next
    self.next.prev = self.prev
  end
end

class LinkedList
  include Enumerable
  attr_accessor :head, :tail

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    current_node = @head.next
    until current_node == @tail
      if current_node.key == key
        return current_node.val
      end
      current_node = current_node.next
    end
    nil
  end

  def include?(key)
    current_node = @head.next
    until current_node == @tail
      if current_node.key == key
        return true
      end
      current_node = current_node.next
    end
    false
  end

  def append(key, val)
    node = Node.new(key, val)
    node.prev = @tail.prev
    @tail.prev.next = node
    @tail.prev = node
    node.next = @tail
  end

  def update(key, val)
    # self.each do |link|
    #   if link.key == key
    #     link.val = val
    #   end
    # end
    current_node = @head.next
    until current_node == @tail
      if current_node.key == key
        current_node.val = val
      end
      current_node = current_node.next
    end
  end

  def remove(key)
    current_node = @head.next
    until current_node == @tail
      if current_node.key == key
        current_node.remove_node
      end
      current_node = current_node.next
    end
  end

  def each
    current_node = @head.next
    count = 0
    until current_node == @tail
      yield current_node
      current_node = current_node.next
      count += 1
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
