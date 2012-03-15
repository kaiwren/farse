require 'spec_helper'

module Farse::Parsers
  describe Parser do
    it "throws an exception if delimiter is invoked" do
      expect { 
        Parser.new(StringIO.new("")).delimiter }.to raise_error(
          NotImplementedError, "This should only be invoked on a sub-class of Farse::Parse::Parser"
        )
    end
  end
end