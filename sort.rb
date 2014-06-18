module Sort
  def self.selection_sort(array)
    array.each_index do |i|
      min = i
      Array(i+1..array.size-1).each do |test|
        min = test if array[min] > array[test]
      end
      array[i], array[min] = array[min], array[i]
    end
    return array
  end
end
