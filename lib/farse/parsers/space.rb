module Farse::Parsers
  class Space < Parser
    def extract_attributes_from(line)
      last_name, first_name, initial, gender, birthday, colour = split(line)
      [last_name, first_name, initial, gender, colour, birthday]
    end
    
    def delimiter
      " "
    end
    
    def birthday_format
      "%m-%d-%Y"
    end
    
    def lookup
      {
        "M" => Farse::Person::MALE,
        "F" => Farse::Person::FEMALE
      }
    end
  end
end