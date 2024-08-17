class ExampleClass
  #instance method
  def hello_world
    puts "Hello Friends ! Welcome to Ruby on Rails..."
  end
 
  #class method
  def self.class_method_example
    puts "This is class method"
  end
end

obj1 = ExampleClass.new

obj1.hello_world

ExampleClass.class_method_example



