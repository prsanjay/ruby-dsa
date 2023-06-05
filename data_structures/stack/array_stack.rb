=begin
  TIME COMPLEXITY

  1.  push, pop, peek, top, is_empty? is having time complexity O(1)
  2.  Searching the stack by value has O(n)

=end

class ArrayStack
  def initialize
    @stack = Array.new
  end

  def push(data)
    @stack.push(data)
  end

  def pop
    @stack.pop
  end

  def peek(index)
    @stack[index]
  end

  def top
    @stack.last
  end

  def is_empty?
    @stack.empty?
  end
end

stack = ArrayStack.new
stack.push(10)
stack.push(20)
stack.push(30)
stack.pop
stack.top