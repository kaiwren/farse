module Farse::Parsers
  class Pipe < Parser
    def extract_attributes_from(line)
      split(line)
    end

    def delimiter
      "|"
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