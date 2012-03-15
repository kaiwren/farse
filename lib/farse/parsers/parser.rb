module Farse::Parsers
  class Parser
    def initialize(io)
      @io = io
    end
    
    def parse
      [].tap do |result|
        @io.each_line do |line|
          last_name, first_name, gender, colour, birthday = line.split(",").map(&:strip)
          result << Farse::Person.new(last_name, first_name, gender, colour, DateTime.strptime(birthday, "%m/%d/%Y"))
        end
      end
    end
    
    def delimiter
      raise NotImplementedError, "This should only be invoked on a sub-class of Farse::Parse::Parser"
    end
  end
end