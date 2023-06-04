=begin

TIME COMPLEXITY

The worst-case time complexity for various operations in a Doubly Linked List is as follows:

1.  Insertion at the beginning or end: O(1)
    In the worst case, inserting a node at the beginning or end of a Doubly Linked List can be done in constant time, as it involves updating a few pointers.

2.  Insertion at a specific position: O(n)
    When inserting a node at a specific position in a Doubly Linked List, the worst-case time complexity is O(n). This is because it may require traversing the list from the head or tail to reach the desired position.

3.  Deletion of a node: O(1) or O(n)
    Deleting a node from a Doubly Linked List can be done in constant time if the node to be deleted is known and its pointers can be updated directly. However, if the node to be deleted is identified based on its value or position and requires traversal, the worst-case time complexity is O(n).

4.  Searching for a node: O(n)
    In the worst case, searching for a specific node in a Doubly Linked List requires traversing the list from either the head or the tail, resulting in a time complexity of O(n).

5.  Accessing a node by index: O(n)
    Unlike arrays, accessing a node in a Doubly Linked List by index is not as efficient. In the worst case, it requires traversing the list from the head or tail until the desired index is reached, resulting in a time complexity of O(n).

It's important to note that these time complexities may vary depending on the specific implementation and optimizations applied to the Doubly Linked List data structure.

=end

class Node
  attr_accessor :data, :prev_node, :next_node

  def initialize(data, prev_node = nil, next_node = nil)
    @data = data
    @prev_node = prev_node
    @next_node = next_node
  end
end


class DoubleLinkedList

  def initialize(data)
    @head = Node.new(data)
  end

  def traverse
    current_node = @head
    while current_node != nil
      p current_node.data
      current_node = current_node.next_node
    end
  end

  def insert(data)
    new_node = Node.new(data)
    current_node = @head
    while current_node.next_node != nil
      current_node = current_node.next_node
    end
    new_node.prev_node = current_node
    current_node.next_node = new_node
  end

  def delete(data)
    current_node = @head
    if current_node.data == data
      @head = current_node.next_node
      @head.prev_node = nil if @head != nil
    else
      while current_node.next_node != nil
        if current_node.next_node.data == data
          # if list is like this: ----|----|----
          current_node.next_node = current_node.next_node.next_node
          current_node.next_node.prev_node = current_node if current_node.next_node != nil
        end
        current_node = current_node.next_node
      end
    end
  end

  def search(data)
    current_node = @head
    while current_node != nil
      return current_node if current_node.data == data
      current_node = current_node.next_node
    end
  end
end

list = DoubleLinkedList.new(10)
list.insert(20)
list.insert(30)
list.traverse
puts "======"

list.delete(10)
list.traverse

p list.search(20)
