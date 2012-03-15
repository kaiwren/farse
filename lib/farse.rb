require "time"

module Farse
  def self.parse(file_path)
    file = File.open(file_path)
    Parsers::Parser.new(file).parse
  ensure
    file.close
  end
end

require "farse/person"
require "farse/parsers"