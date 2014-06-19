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

  def self.merge_sort(array)
    return array if array.size <= 1
    split = array.size / 2
    a, b = merge_sort(array.pop(split)), merge_sort(array)
    a_counter = b_counter = 0
    solution = []
    sort = lambda { |a,b| return (a < b) ? (a_counter += 1) && a : (b_counter += 1) && b }
    (a.size + b.size).times do
      if a_counter >= a.size
        solution += b[b_counter..-1]
        break
      else
        if b_counter >= b.size
          solution += a[a_counter..-1]
          break
        else
          solution << sort.call(a[a_counter], b[b_counter])
        end
      end
    end
    solution
  end
end
