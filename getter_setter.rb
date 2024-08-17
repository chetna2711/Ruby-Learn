class GetterSetter

  def initialize(name)
    @name = name
 
    #getter method
    def name
      puts @name
    end

    #setter method

    def name=(name)
          @name = name
    end
  end

end

obj1 = GetterSetter.new('rituuu')

obj1.name       #this because getter method

obj1.name = "Chetna"

obj1.name        #this because  setter method