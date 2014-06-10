require 'rubygems'
require 'pry-debugger'

module ArrayUtil
  def self.max(array)
    max = array.pop
    array.each { | test | max = test if test > max }
    max
  end

  def self.middle_element(array)
    #get the array size
    size = array.size 
    return nil if size == 0
    #create an array with either the middle element (odd) index or the two 
    #middle elements (even)
    indices = (size % 2 == 1) ? array[(size / 2)] : (array[(size / 2)] + array[(size / 2 - 1)]) / 2.0
    #sum the elements in the array at the indices in the index_array. Divide by the 
    #number of elements in the indices array
  end

  def self.sum_arrays(array1, array2)
    max_len = array1.size > array2.size ? array1.size : array2.size
    Array (0..max_len-1).map { |index| array1[index] + array2[index] }
  end
end
