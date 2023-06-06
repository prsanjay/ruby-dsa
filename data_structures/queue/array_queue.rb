=begin
- Queue is First In First Out Operation. FIFO

TIME COMPLEXITY

1.  enqueue operation: O(1)
2.  dequeue operation: O(N) as this needs to shift all the other elements
3.  All other operations are having O(1) time complexity.


  -------------
    |   |   |
  -------------
=end

class ArrayQueue

  def initialize
    @queue = []
  end

  def enqueue(data)
    @queue.push(data)
  end

  # .shift method deletes the first element from array.
  def dequeue
    @queue.shift
  end

  def front
    @queue.first
  end

  def empty?
    @queue.empty?
  end

  def size
    @queue.size
  end
end