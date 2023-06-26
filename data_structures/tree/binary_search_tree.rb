require 'pry'

class Node
  attr_accessor :data, :left, :right

  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(data)
    if @root.nil?
      @root = Node.new(data)
    else
      insert_recursive(@root, data)
    end
  end

  def insert_recursive(node, data)
    return Node.new(data) if node.nil?

    if data < node.data
      node.left = insert_recursive(node.left, data)
    else
      node.right = insert_recursive(node.right, data)
    end
    # Need to return the updated node to the previous function into the stack frame.
    # If we do not do this then this function will return the value assigned to node.right or node.left
    return node
  end

  # In BST In-order traversal gives result in ascending order
  def inorder_traversal
    recursive_inorder(@root)
  end

  def recursive_inorder(node)
    if !node.nil?
      recursive_inorder(node.left)
      p node.data
      recursive_inorder(node.right)
    end
  end

  def search(value)
    search_recursive(@root, value)
  end

  def search_recursive(node, value)
    return if node.nil?

    if node.data == value
      return node
    else
      if value < node.data
        search_recursive(node.left, value)
      else
        search_recursive(node.right, value)
      end
    end
  end

=begin
  Deleting a node from a binary search tree (BST) involves three main cases:

  1. Node with no children: In this case, we simply remove the node from the tree. This will be the leaf nodes or root node with no children.
  2. Node with one child: We replace the node with its child. Lets say the root node has only one child and that is also left child then we will replace root node with its left child. Same goes for other parents as well who has only one child.
  3. Node with two children: We find the inorder successor or predecessor of the node (i.e., the node with the next highest or next lowest value in the BST), swap its value with the node to be deleted, and then delete the successor or predecessor node.

    Here, inorder-predecessor mean, the node which comes before the node which we are going to delete and inorder-successor mean, the node which comes after the node which are going to delete.

    To find inorder-predecessor we need to find the right-most child of left sub-tree. To find inorder-successor, we need to find the left-most child of right sub-tree.
=end
  def delete(key)
    recursive_delete(@root, key)
  end

  def recursive_delete(node, key)
    return if node.nil?

    # If the node is leaf node or the node is root node with no children.
    # case-1 : Delete leaf node from left or right sub-tree based on key value.
    if node.left.nil? && node.right.nil? && node.data == key
      node = nil
      return node
    end

    # here, we are finding the node with matching key
    if key < node.data
      node.left = recursive_delete(node.left, key)
    elsif key > node.data
      node.right = recursive_delete(node.right, key)
    else
      # case-2: Node with two children or one children
      # Find the inorder-successor (smallest value in the right subtree or left-most node of right sub-tree)
      successor = find_min_node(node.right)
      node.data = successor.data
      # Delete the successor node from the right subtree. Here we are passing key as successor.data now so it will delete the node with that key
      # Here we are making modifications only on right subtree as we used successor to replace the node which we are deleting and successor is present on right sub-tree
      node.right = recursive_delete(node.right, successor.data)
    end

    return node
  end

  # Find the left most node
  def find_min_node(node)
    current_node = node
    while current_node.left
      current_node = current_node.left
    end
    current_node
  end


=begin
  we can perform an in-order traversal of the tree and check if the resulting values are in ascending order. If they are, then the tree is a BST; otherwise, it is not.

  If we directly pass the prev_node to the recursive function calls instead as array then it doesn't affect the value of prev_node in the caller's scope.

  When the bst_inorder function is called recursively for the left subtree, a new instance of prev_node is created for that recursive call. Any modifications made to prev_node within the recursive call only affect that local instance of prev_node, not the original prev_node from the caller's scope.

  So, when the function returns from the recursive call, the value of prev_node in the caller's scope remains unchanged, and any updates made to prev_node within the recursive call are lost.

  To overcome this issue, we need to find a way to propagate the updated prev_node value back to the caller's scope. One way to achieve this is by using a container object, such as an array, to hold the prev_node value and pass it by reference. By doing so, we can modify the value within the recursive calls, and the changes will be visible to the caller's scope as well.
=end
  def binary_tree_is_bst?
    prev_node = [nil]
    bst_inorder(@root, prev_node)
  end

  def bst_inorder(node, prev_node)
    return true if node.nil?

    return false unless bst_inorder(node.left, prev_node)

    if prev_node[0] && node.data <= prev_node[0].data
      return false
    end
    prev_node[0] = node

    return bst_inorder(node.right, prev_node)
  end

  def binary_tree_is_bst_using_min_max_value?
    is_bst_helper(@root, -Float::INFINITY, Float::INFINITY)
  end

  def is_bst_helper(node, min_val, max_val)
    return true if node.nil?

    # Check if the current node violates the BST property
    # In the recursive calls, the min_val and max_val are the value of the prev node.
    if node.data <= min_val || node.data >= max_val
      return false
    end

    # Recursively check the left and right subtrees
    return is_bst_helper(node.left, min_val, node.data) && is_bst_helper(node.right, node.data, max_val)
  end

  # As this is BST, the max value will be either root node or right side of root node. We need to find the most right node in BST and that will be the result.
  def max_value
    return if @root.nil?

    current_node = @root

    while current_node.right
      current_node = current_node.right
    end
    current_node.data
  end

  def min_value
    return if @root.nil?

    current_node = @root

    while current_node.left
      current_node = current_node.left
    end
    current_node.data
  end
end

tree = BinarySearchTree.new
tree.insert(15)
tree.insert(16)
tree.insert(17)
tree.insert(18)
tree.insert(7)
tree.insert(9)
tree.insert(11)
tree.insert(12)
p tree
puts "===inorder_traversal=="
tree.inorder_traversal
puts "===Search and return the node ==="
p tree.search(70)
puts "==== max_value ==="
p tree.max_value
puts "==== min_value ==="
p tree.min_value
puts "==== Binary tree is bst ==="
p tree.binary_tree_is_bst?
puts "==== Delete key from BST ==="
p tree.delete(15)

