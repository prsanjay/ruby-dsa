class Node
  attr_accessor :data, :next_node

  def initialize(data, next_node = nil)
    @data = data
    @next_node = next_node
  end
end

class LinkedListStack
  def initialize
    @top = nil
    @size = 0
  end

=begin
  The push method creates a new node with the given item and adds it to the top of the linked list. The next pointer of the new node is set to the previous top node, and @top is updated to point to the new node. This effectively adds the new item to the top of the stack.
=end
  def push(data)
    new_node = Node.new(data)
    new_node.next_node = @top
    @size += 1
    @top = new_node
  end

  def pop
    raise "Stack is empty" if empty?

    popped_item = @top.data
    @top = @top.next
    @size -= 1
    popped_item
  end

  def empty?
    @top.nil?
  end
end