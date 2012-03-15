module Farse
  class Person
    MALE = Object.new
    FEMALE = Object.new
    
    attr_reader :last_name, :first_name, :initial, :gender, :colour, :birthday
    
    def initialize(last_name, first_name, initial, gender, colour, birthday)
      @last_name = last_name
      @first_name = first_name
      @initial = initial
      @gender = gender
      @colour = colour
      @birthday = birthday
    end
    
    def ==(other)
      return true if self.equal?(other)
      return false if self.class != other.class
      last_name == other.last_name &&
      first_name == other.first_name &&
      initial == other.initial &&
      gender == other.gender &&
      colour == other.colour &&
      birthday == other.birthday
    end
    
    def eql?(other)
      self == other
    end
    
    def hash
      37 * (last_name.hash + first_name.hash + initial.hash + gender.hash + colour.hash + birthday.hash)
    end
  end
end