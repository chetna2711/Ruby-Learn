class Student
  def initialize(name,email,contact)
    @name = name
    @email = email
    @contact = contact
  end


  #this is a getter methods
  def name
    puts "Name = #{@name}"
  end
  
  def email
    puts "Email = #{@email}"
  end

  def contact
    puts "Contact No = #{@contact}"
  end

  #this is a setter methods

  def name=(name)
    @name = name
  end

  def email=(email)
    @email = email
  end

  def contact=(contact)
    @contact = contact
  end
end

s1 = Student.new('chetna','chetu@gmail.com','9876543245')

 #this is call a getter method
s1.name
s1.email
s1.contact


s1.name = "ritu"
s1.email = 'ritu@gmail.com'
s1.contact = '1324567678'

#this is call a setter method to update the value
s1.name
s1.email
s1.contact
