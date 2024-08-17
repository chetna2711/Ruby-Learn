# .. means i <= 10
for i in 1..10
  puts "Hello ! How are you?"
end


# ... means i < 10
for i in 1...10
  puts "Thank you!"
end

#Nested for loop

n = 5

for i in 1...n
  puts "This is another loop"
    for i in 1...n/2
      puts "This is inner loop"
    end

    puts "This is outer loop"
end
