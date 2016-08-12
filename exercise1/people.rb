class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  def greeting
    return "Hi, my name is #{name}"
  end

end




class Student < Person

  def learn
    puts "I get it"
  end

end


class Instructor < Person

  def teach
    puts "Everything in Ruby is an Object"
  end
end


instructor1 = Instructor.new("Chris")
student1 = Student.new("Christina")
instructor1.teach
student1.learn
