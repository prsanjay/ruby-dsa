require "pry"

class Node
  attr_accessor :data, :left, :right

  def initialize(data, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end


=begin
  The traversal can be understood based on its name.
  Pre  - mean Root will come first and then left and right
  In   - mean Root will go between left and right
  post - mean Root will go last after left and right
=end

class BinaryTree

  def initialize
    @root = nil
  end

  def insert(data)
    if @root.nil?
      @root = Node.new(data)
    else
      insert_recursive(data, @root)
    end
  end

=begin
  This will generate left heavy binary tree.
  The root node will have just one right node and then all the nodes goes on left side of root node.
=end
  def insert_recursive(data, node)
    if node.left.nil?
      node.left = Node.new(data)
    elsif node.right.nil?
      node.right = Node.new(data)
    else
      # This will add all the nodes on left side of the root node.
      # If we want to add all the nodes on right of root then pass `node.right` in 2nd argument.
      insert_recursive(data, node.left)
    end
  end

  # root --> left --> right
  def preorder_traversal
    recursive_preorder(@root)
  end

  # root --> left --> right
  def recursive_preorder(node)
    if !node.nil?
      p node.data
      recursive_preorder(node.left)
      recursive_preorder(node.right)
    end
  end

  # left --> root --> right
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

  # left --> right --> root
  def postorder_traversal
    recursive_postorder(@root)
  end

  def recursive_postorder(node)
    if !node.nil?
      recursive_postorder(node.left)
      recursive_postorder(node.right)
      p node.data
    end
  end

=begin
  - In level order traversal we need to traverse the tree level-by-level from left to right
  - This is also called breadth-first-search
  - We can do this by using queue data structure. visit the node and push it to queue.
  - Dequeue the node from queue and then push dequeued node's left and right child to the queue. Repeat this process unless queue is empty
=end
  def levelorder_traversal
    return if @root.nil?

    queue = []
    queue << @root

    while !queue.empty?
      node = queue.shift # remove first element from array. FIFO
      p node.data

      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
  end

=begin
  - in the preorder traversal we first traverse the root, then left most subtree
  and then right most subtree.
  - This can be implemented using the explicit stack. Recursive preorder is also using the call stack.
  - Here, we need to use stack as stack follows LIFO and we also want that, the left most node should pop-out first from the stack as that will be pushed in top of the stack.
=end
  def iterative_preorder
    return if @root.nil?

    stack = []
    stack << @root

    while !stack.empty?
      node = stack.pop

      p node.data
      # even though traversal is root -> left -> right, we are first pushing right node and then left because, when we pop, first left node should get pop-out as this is LIFO.
      stack << node.right unless node.right.nil?
      stack << node.left unless node.left.nil?
    end
  end


  # left --> root --> right
  # push left child to stack unless node becomes nil. then pop-out the element, print and move to right child.
  def iterative_inorder
    return if @root.nil?

    stack = []
    current_node = @root

    while !stack.empty? || !current_node.nil?
      if !current_node.nil?
        stack.push(current_node)
        current_node = current_node.left
      else
        current_node = stack.pop
        p current_node.data

        current_node = current_node.right
      end
    end
  end

# left --> right --> root
=begin
- Iterative postorder is bit tricky.
- In this case we use 2 stacks. One to store the visited node in Root --> right --> left manner. And another stack to pop-out elements from that stack.
- While we push elements in 1st stack, it appears as preorder but its not preorder. Preorder follows, root, left, right but here we used root, right, left.
- We used the reverse order because, stack follows LIFO and in postorder we want left, right and then root. So, in stack1 we pushed the nodes in this order: root, right, left(root in bottom, then right in middle and left in top) and when we pop-up, it will be popped-out in this order: left(top), right(middle), root(bottom).
=end
  def iterative_postorder
    return if @root.nil?

    stack1 = [@root]
    stack2 = []

    # This is like preorder but with bit diff implementation. Root, right, left. Instead Root, Left, Right
    while !stack1.empty?
      node = stack1.pop
      stack2.push(node)

      stack1.push(node.left) unless node.left.nil?
      stack1.push(node.right) unless node.right.nil?
    end

    while !stack2.empty?
      node = stack2.pop
      p node.data
    end
  end

  def height
    recursive_height(@root)
  end

=begin
- The height of a binary tree is defined as the maximum number of edges in the longest path from the root node to any leaf node in the tree.
- Here, we will find left-subtree height and right-subtree height and then find max from both and add one to it.
- When we find the leaf node, we need to return -1 to balance out the overall height. If we return 0 then the height will become no of edges from root to leaf node + 1. so if the tree has only one node and if we return 0 then the height will become 1 which is wrong. Height of tree having one node is zero and not one.
- Ref: https://www.youtube.com/watch?v=_pnqMz5nrRs
=end
  def recursive_height(node)
    return -1 if node.nil?

    left_height = recursive_height(node.left)
    right_height = recursive_height(node.right)

    [left_height, right_height].max + 1
  end

  # Time complexity is O(N) where N is number of nodes. Space complexity is O(h) where h is height of tree which recursive calls are using.
  def search(value)
    search_recursive(@root, value)
  end

  def search_recursive(node, value)
    return false if node.nil?

    if node.data == value
      return true
    else
      search_recursive(node.left, value) || search_recursive(node.right, value)
    end
  end

  def count_of_nodes
    recursive_count(@root)
  end

  def recursive_count(node)
    return 0 if node.nil?

    left_count = recursive_count(node.left)
    right_count = recursive_count(node.right)
    left_count + right_count + 1
  end
end

tree = BinaryTree.new
tree.insert(10)
tree.insert(11)
tree.insert(12)
tree.insert(13)
tree.insert(14)
tree.insert(15)
tree.insert(16)
puts "== Preorder Traversal =="
tree.preorder_traversal
puts "== Inorder Traversal =="
tree.inorder_traversal
puts "== Postorder Traversal =="
tree.postorder_traversal
puts "== Levelorder Traversal =="
tree.levelorder_traversal
puts "=== Iterative preorder ==="
tree.iterative_preorder
puts "=== Iterative inorder ==="
tree.iterative_inorder
puts "=== Iterative postorder ==="
tree.iterative_postorder
puts "=== Tree height ==="
p tree.height
puts "=== Search the value ==="
p tree.search(17)
puts "=== Count of nodes ==="
p tree.count_of_nodes

