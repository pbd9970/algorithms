
class Node
  attr_writer :next_element

  def initialize(value)
    @value = value
    @next_element = nil
  end
end

class Linklist
  include Enumerable
  attr_reader :begin, :end, :size

  def initialize(*enum)
    @size = 0
    @begin, @end = nil
    enum.flatten!
    enum.each { |x| push(x) }
  end

  def push(element)
    @size += 1
    node = Node.new(element)
    @end.next_element = node
    @begin ||= node
    @end = node
  end

  def pop()
    @size -= 1
    raise NotImplementedError
  end

  def shift()
    @size -= 1
    element = @begin
    @begin = element.next_element
    element.value
  end

  def unshift(element)
    @size += 1
    node = Node.new(element)
    node.next_element = @begin
    @end ||= node
    @begin = node
  end
end

class Stack
  def initialize(array = [])
    @stack = array
  end

  def peek()
    @stack.last
  end

  def pop
    @stack.pop
  end
  
  def push(value)
    @stack << value
  end
end

class QueueX < Linklist
  def initialize
    super
  end

  def peek
    @end.value
  end
end
