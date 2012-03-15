module Farse::Parsers
  class Parser
    def self.build_for(io)
      line = io.readline
      io.rewind
      case line
      when /\,/
        Csv.new(io)
      when /\|/
        Pipe.new(io)
      when /\s/
        Space.new(io)
      end
    end
    
    def initialize(io)
      @io = io
    end
    
    def parse
      [].tap do |result|
        @io.each_line do |line|
          last_name, first_name, initial, gender_text, colour, birthday_text = extract_attributes_from(line)
          result << Farse::Person.new(
            last_name, first_name, initial, lookup[gender_text], colour, DateTime.strptime(birthday_text, birthday_format)
          )
        end
      end
    end
    
    def split(line)
      line.split(delimiter).map(&:strip)
    end
    
    def delimiter
      raise Farse::MustSubclassError
    end
    
    def birthday_format
      raise Farse::MustSubclassError
    end
    
    def lookup
      raise Farse::MustSubclassError
    end
  end
end