module Set1
  def self.swap_small(array)
    smallest = 0
    array.each_index { |i| smallest = i if array[i] < array[smallest] }
    array[smallest], array[0] = array[0], array[smallest]
    array
  end

  def self.find_sum_2(array, sum = 0)
    sum_hash = {}
    array.each do | x |
      sum_hash[x] = 1
      return true unless sum_hash[sum - x].nil?
    end
    return false
  end

  def self.find_sum_3(array)
    array.each do |x|
      sum_hash = {}
      array.each do |y|
        sum_hash[y] = 1
        puts "x=#{x}, y=#{y}"
        return true unless sum_hash[0 - x - y].nil?
      end
    end
    return false
  end
end
