
def fizzbuzz(n)
  fizzbuzz(n - 1) if n > 1
  print n unless fizz(n)
  puts
end 

def fizz(n)
  print "fizz" if n%3 == 0
  buzz(n) || n%3 == 0
end

def buzz(n)
  print "buzz" if n%5 == 0
  n%5 == 0  
end

#fizzbuzz(30)
