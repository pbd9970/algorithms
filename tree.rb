class BinaryTree
  attr_reader :head
  def initialize(head)
    @head = Node.new(head)
  end

  def search(test_value)
    result, node = _search(test_value)
    result
  end

  def _search(element, node=@head)
    return [true, node] if element == node.value
    if element < node.value
      return [false, node] if node.left_child.nil?
      _search(element, node.left_child)
    elsif element > node.value
      return [false, node] if node.right_child.nil?
      _search(element, node.right_child)
    else
      raise NumberError
    end
  end

  def add_node(value)
    duplicate, node = _search(value)
    raise NumberError, "Value exists in tree" if duplicate
    node.add_child(value)
  end

  def tree_array(node)
    return_array = []
    return_array + tree_array(node.left_child) unless node.left_child.nil?
    return_array << node.value
    return_array + tree_array(node.right_child) unless node.right_child.nil?
    return_array
  end

  def self.tree_constructor(array)
    head_index = array.length / 2
    tree = BinaryTree.new(array[head_index])

    left_side  = array.slice(0..head_index-1)
    right_side = array.slice(head_index+1..-1)

    tree.head.left_child  = __tree_constructor__(left_side)  unless left_side.empty?
    tree.head.right_child = __tree_constructor__(right_side) unless right_side.empty?
    tree
  end

  def self.__tree_constructor__(array)
    raise KeyError, "Node cannot be nil" if array.empty?
    node_index = array.length / 2
    node = Node.new(array[node_index])
    return node if array.length <= 1
   
    left_side  = node_index == 0 ? [] : array.slice(0..node_index-1)
    right_side = array.slice(node_index+1..-1)

    node.left_child  = __tree_constructor__(left_side)  unless left_side.empty?
    node.right_child = __tree_constructor__(right_side) unless right_side.empty?
    node
  end
    
  def rebalance_tree
    values = tree_array(@head)

    tree_constructor(values)
  end
end

class Node
  attr_reader :value
  attr_accessor :left_child, :right_child
  def initialize(value, left_child=nil, right_child=nil)
    @value = value
    @left_child = left_child
    @right_child = right_child
  end

  def add_child(value)
    if value < @value
      @left_child = Node.new(value)
    elsif value > @value
      @right_child = Node.new(value)
    else
      raise NumberError
    end
  end
end
