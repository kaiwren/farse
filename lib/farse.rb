require "time"

module Farse
  def self.parse(file_path)
    file = File.open(file_path)
    Parsers::Parser.build_for(file).parse
  ensure
    file.close
  end
end

require "farse/must_subclass_error"
require "farse/person"
require "farse/parsers"