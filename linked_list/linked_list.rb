
class Node
  attr_writer :next_element

  def initialize(value)
    @value = value
    @next_element = nil
  end
end

class Linklist
  include Enumberable
  attr_reader @begin, @end

  def initialize(*enum)
    @begin, @end = nil
  end

  def push(element)
    node = Node.new(element)
    @end.next_element = node
    @end = node
  end

  def pop()
    raise NotImplementedError
  end

  def shift()
    element = @begin
    @begin = element.next_element
    element.value
  end

  def unshift(element)
    node = Node.new(element)
    node.next_element = @begin
    @begin = node
  end
end

class Stack < Array
  def peek()
    self.last
  end
end

class Queue < Linklist
  def peek
    @end.value
  end
end
