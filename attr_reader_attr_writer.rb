class Student

  attr_reader  :name, :email, :contact
  attr_writer  :name, :email, :contact

  def initialize(name,email,contact)
    @name = name
    @email = email
    @contact = contact
  end
end

s1 = Student.new('chetna','chetu@gmail.com','9876543245')

#attr_reader automatically generate getter method
puts s1.name
puts s1.email
puts s1.contact


s1.name = "ritu"
s1.email = 'ritu@gmail.com'
s1.contact = '1324567678'

#attr_writer automatically generate setter method
puts s1.name
puts s1.email
puts s1.contact


