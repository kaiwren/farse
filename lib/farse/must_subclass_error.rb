module Farse
  class MustSubclassError < NotImplementedError
    def initialize
      super("This method should only be invoked on a sub-class of Farse::Parse::Parser")
    end
  end
end