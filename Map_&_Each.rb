# Map method

# Example 1
array = [1,2,3,4,5,6]

square = array.map{ |num| num * num}

puts square

# Example 2

array1 = ["1","2","3","4","5"]\

number = array1.map{ |str| str.to_i}

puts number

# Each method

array2 = [1,2,3,4,5]

array2.each  do |i|
  puts i + 2
end
