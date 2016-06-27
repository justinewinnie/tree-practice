class TreeNode
   attr_accessor :value, :left, :right

   def initialize(val)
     @value = val
     @left = nil
     @right = nil
   end
end

# 1.
# start with base case node is nil
# check left nodes all the way down
# if a node is an operator, print it
# check right nodes all the way down
def print_operators(node)
  operators = ["+", "-", "%", "*", "/"]
  return if node == nil
  print_operators(node.left)
    if operators.include?(node.value)
      print node.value
    end
  print_operators(node.right)
end

# 2.
# start with base case node is nil
# check left nodes all the way down
# if a node is an operand, print it
# check right nodes all the way down
def print_non_operators(node)
  operators = ["+", "-", "%", "*", "/"]
  return if node == nil
  print_non_operators(node.left)
    unless operators.include?(node.value)
      print node.value
    end
  print_non_operators(node.right)
end

# def count_non_operators(node, count = 0)
#   operators = ["+", "-", "%", "*", "/"]
#   if node == nil
#     puts count
#     return count
#   end
#   count_non_operators(node.left, count)
#     if node.left == nil && node.right == nil
#       count_non_operators(node, count += 1)
#     end
#   count_non_operators(node.right, count)
#     if node.left == nil && node.right == nil
#       count += 1
#     end
# end

# root = TreeNode.new("-")
# root.left = TreeNode.new("+")
# root.right = TreeNode.new("10")
# root.left.left = TreeNode.new("3")
# root.left.right = TreeNode.new("2")
# count_non_operators(root)

# 3.
def print_infix(node)
  return if node == nil
  print_infix(node.left)
  print node.value + " "
  print_infix(node.right)
end

# check left
# check right
# print value
def print_postfix(node)
  return if node == nil
  print_postfix(node.left)
  print_postfix(node.right)
  print node.value + " "
end

# print node
# check left
# check right
def print_prefix(node)
  return if node == nil
  print node.value + " "
  print_postfix(node.left)
  print_postfix(node.right)
end

 # 1.    3 + 2
 # 2.    3 + 2 - 10
 # 3.    4 * 3 + 2
 # 4.    4 * 3 + 2 - 10 % 5

# root = TreeNode.new("+")
# root.left = TreeNode.new("3")
# root.right = TreeNode.new("2")
# print_infix(root)

# 3 + 2 - 10

# root = TreeNode.new("-")
# root.left = TreeNode.new("+")
# root.right = TreeNode.new("10")
# root.left.left = TreeNode.new("3")
# root.left.right = TreeNode.new("2")
# print_infix(root)
# print_postfix(root)

# root = TreeNode.new("+")
# root.left = TreeNode.new("*")
# root.right = TreeNode.new("2")
# root.left.left = TreeNode.new("4")
# root.left.right = TreeNode.new("3")
# print_operators(root)
