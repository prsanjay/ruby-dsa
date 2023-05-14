class Node
  attr_accessor :data, :next_node

  def initialize(data, next_node = nil)
    @data = data
    @next_node = next_node
  end
end

class LinkedList
  def initialize(data)
    @head = Node.new(data, nil)
  end

  def append(val)
    current_node = @head
    new_node = Node.new(val, nil)
    while current_node.next_node != nil
      current_node = current_node.next_node
    end
    current_node.next_node = new_node
  end

  # Delete specific node by its val
  def delete(val)
    current_node = @head
    if current_node.data == val
      @head = current_node.next_node
    end
    while current_node.next_node != nil
      if current_node.next_node.data == val
        current_node.next_node = current_node.next_node.next_node
      else
        current_node = current_node.next_node
      end
    end
  end

  def find(val)
    current_node = @head
    if current_node.next_node == nil && current_node.data == val
      return current_node
    end
    while current_node.next_node != nil
      current_node = current_node.next_node
      return current_node if current_node.data == val
    end
  end

  # Print value of each node in the list
  def traverse
    current_node = @head
    puts current_node.data
    current_node = current_node.next_node
    while current_node != nil
      puts current_node.data
      current_node = current_node.next_node
    end
  end
end

list = LinkedList.new(10)
list.append(20)
list.append(30)
list.append(40)
list.traverse
puts "==> Before delete"
list.delete(30)
list.traverse
puts "==> After delete"