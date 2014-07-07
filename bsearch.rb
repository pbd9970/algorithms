require 'rubygems'
require 'pry-debugger'

module ArrayUtil
  def self.bsearch(array, element)
    return false if array.empty?
    array = array.sort
    _bsearch(array, element)
  end

  def self._bsearch(array, element)
    start_index = array.length / 2
    
    return true if array[start_index] == element
    return false if array.length <= 1

    if element < array[start_index]
      _bsearch(array.slice(0..start_index-1), element)
    elsif element > array[start_index]
      _bsearch(array.slice(start_index+1..-1), element)
    else
      raise TypeError, "No implicit conversion of #{array[start_index]} to number"
    end
  end
end
