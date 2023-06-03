=begin

The worst-case time complexity for various operations in a Singly Linked List is as follows:

1.  Insertion at the beginning (prepend): O(1) - Constant time complexity.
2.  Insertion at the end (append): O(n) - Linear time complexity, as you need to traverse the entire list to reach the end.
3.  Insertion at a specific position: O(n) - Linear time complexity, as you need to traverse the list to reach the desired position.
4.  Deletion from the beginning: O(1) - Constant time complexity.
5.  Deletion from the end: O(n) - Linear time complexity, as you need to traverse the entire list to reach the end.
6.  Deletion from a specific position: O(n) - Linear time complexity, as you need to traverse the list to reach the desired position.
7.  Searching for an element: O(n) - Linear time complexity, as you may need to traverse the entire list to find the element.
8.  Accessing an element at a specific position: O(n) - Linear time complexity, as you need to traverse the list to reach the desired position.

In general, the time complexity of most operations in a Singly Linked List is O(n) because you may need to traverse the list from the beginning or a specific position to perform the desired operation.

=end


class Node
  attr_accessor :data, :next_node

  def initialize(data, next_node = nil)
    @data = data
    @next_node = next_node
  end
end


class LinkedList
  def initialize(val)
    @head = Node.new(val)
  end

  def traverse
    current_node = @head
    while current_node != nil
      p current_node.data
      current_node = current_node.next_node
    end
  end

  # Insert the node in linkedlist
  def insert(val)
    current_node = @head
    new_node = Node.new(val)
    while current_node.next_node != nil
      current_node = current_node.next_node
    end
    current_node.next_node = new_node
  end

  # Search the node having specific value
  def search(val)
    current_node = @head
    return current_node if current_node.data == val

    while current_node != nil
      return current_node if current_node.data == val

      current_node = current_node.next_node
    end
  end

  # Delete the node having specific value
  def delete(val)
    current_node = @head
    if current_node.data == val
      @head = current_node.next_node
    else
      while current_node.next_node != nil
        if current_node.next_node.data == val
          current_node.next_node = current_node.next_node.next_node
        end
        current_node = current_node.next_node
      end
    end
  end

  # Update the node having specific value
  def update(old_val, new_val)
    current_node = @head
    while current_node != nil
      current_node.data = new_val if current_node.data == old_val
      current_node = current_node.next_node
    end
  end
end

list = LinkedList.new(10)
list.insert(20)
list.insert(30)
list.insert(40)

p list.traverse

#p list.search(30)

list.update(20, 50)
p list.traverse