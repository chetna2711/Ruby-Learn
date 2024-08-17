# #Conditional flow

# #if...else

# puts "Enter the Number..."

# a = gets.to_i

# if a % 2 == 0
#     puts "Number is Even"
# else
#     puts "Number is Odd"
# end

# #if..else..elsif
# a = 50
# b = 20
# c = 10

# if a > 40

#   puts 'a is greater than 40'

# elsif b > 40

#   puts 'b is greater than 40'

# elsif  c > 40

#   puts 'c is greater than 40'

# else

#   puts 'None of them is greater than 40'

# end


# #cse...when statement

# day = gets.to_i

# case day
# when day = 1
#   puts "Monday"
# when day = 2
#   puts "Tuesday"
# when day = 3
#   puts "Wednesday"
# when day = 4
#   puts "Thuresday"
# when day = 5
#   puts "Friday"
# when day = 6
#   puts "Saturday"
# when day = 7
#   puts "Sunday"
# else
#   puts "Not present"
# end

# #example 2 in case statement

# age = gets.to_i

# case age
# when 1..12
#   puts "Person is Kid"
# when 13..18
#   puts "Person is Teen age"
# when 19..45
#   puts "Person is Young"
# when 46..90
#   puts "Person is Senier citizen"
# else
#   puts "I have no idea what to say about"
# end

#shortcut for above code
age = gets.to_i

case age
when 1..12 then puts "Person is Kid"
when 13..18  then puts "Person is Teen age"
when 19..45  then puts "Person is Young"
when 46..90  then puts  "Person is Senier citizen"
else
  puts "I have no idea what to say about"
end

#unless statement

age = gets.to_i

unless age > 18
  puts "Person can not vote"
else
  puts "Person can vote"
end
