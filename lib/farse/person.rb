module Farse
  class Person
    attr_reader :last_name, :first_name, :gender, :colour, :birthday
    def initialize(last_name, first_name, gender, colour, birthday)
      @last_name = last_name
      @first_name = first_name
      @gender = gender
      @colour = colour
      @birthday = birthday
    end
    
    def ==(other)
      return true if self.equal?(other)
      return false if self.class != other.class
      last_name == other.last_name &&
      first_name == other.first_name &&
      gender == other.gender &&
      colour == other.colour &&
      birthday == other.birthday
    end
    
    def eql?(other)
      self == other
    end
    
    def hash
      37 * (last_name.hash + first_name.hash + gender.hash + colour.hash + birthday.hash)
    end
  end
end