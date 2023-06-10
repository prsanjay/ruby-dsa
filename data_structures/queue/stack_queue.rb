class StackQueue
  def initialize
    @stack1 = []
    @stack2 = []
  end


=begin
  In this implementation, we use two stacks @stack1 and @stack2. The enqueue method works by transferring all elements from @stack1 to @stack2, pushing the new item to @stack1, and then transferring back all elements from @stack2 to @stack1. This ensures that the elements are ordered correctly in the queue.

  This method has O(N) time complexity
=end
  def enqueue(data)
    while !@stack1.empty
      @stack2 << @stack1.pop
    end
    @stack1.push(data)
    while !@stack2.empty
      @stack1 << @stack2.pop
    end
  end

  # This method has O(1) time complexity
  def dequeue
    data = @stack1.pop
  end

  # This method has O(1) time complexity
  def enqueue2
    @stack1.push(data)
  end

  # This method has O(N) time complexity
  def dequeue2
    @stack1.shift
  end

  def head
    @stack1.first
  end

  def tail
    @stack1.last
  end
end

q = StackQueue.new
q.enqueue(10)
q.enqueue(20)
q.enqueue(30)