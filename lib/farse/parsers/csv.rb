module Farse::Parsers
  class Csv < Parser
    def extract_attributes_from(line)
      last_name, first_name, gender_text, colour, birthday_text = split(line)
      [last_name, first_name, "", gender_text, colour, birthday_text]
    end
    
    def delimiter
      ","
    end
    
    def birthday_format
      "%m/%d/%Y"
    end
    
    def lookup
      {
        "Male" => Farse::Person::MALE,
        "Female" => Farse::Person::FEMALE
      }
    end
  end
end