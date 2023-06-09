class Node
  attr_accessor :data, :next_node

  def initialize(data, next_node = nil)
    @data = data
    @next_node = next_node
  end
end

class LinkedListQueue
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def traverse
    current_node = @head
    while current_node != nil
      p current_node.data
      current_node = current_node.next_node
    end
  end

  def enqueue(data)
    new_node = Node.new(data)
    if @head.nil?
      @head = new_node
      @tail = @head
    else
      @tail.next_node = new_node
      @tail = new_node
    end
    @size += 1
  end

  # delete the first node from the linked list
  # ideally the first node will be the head node.
  # Unlink the head node and make next_node of head node as the new head
  def dequeue
    raise 'queue is empty' if empty?

    dequeued_item = @head.data

    @head = @head.next_node
    @tail = nil if @head.nil?
    @size -= 1
    dequeued_item
  end

  def empty?
    @head.nil?
  end

  def front
    raise 'queue is empty' if empty?

    @head.data
  end

  def rear
    raise 'queue is empty' if empty?

    @tail.data
  end
end


queue = LinkedListQueue.new
queue.enqueue(10)
queue.enqueue(20)
queue.traverse
queue.dequeue
puts '====After dequeue==='
queue.traverse