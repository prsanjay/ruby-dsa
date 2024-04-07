require 'pry'

def is_blanaced_binary_tree(root)
  return if root.nil?

  check_balance(root) != -1
end

def check_balance(node)
  return 0 if node.nil?

  left_height = check_balance(node.left)
  return -1 if left_height == -1

  right_height = check_balance(node.right)
  return -1 if right_height == -1

  if (left_height - right_height).abs > 1
    return -1
  else
    return [left_height, right_height].max + 1
  end
end