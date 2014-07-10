require 'pry-debugger'

class Fibonacci
  def initialize
    @cache = {
      2 => 1,
      1 => 1,
      0 => 0
    }
  end
    
  def find_index(n)
    return @cache[n] if @cache[n]
    @cache[n] = find_index(n-1) + find_index(n-2)
  end
end
