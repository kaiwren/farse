require 'spec_helper'

module Farse::Parsers
  describe Parser do
    %w(delimiter birthday_format lookup).each do |abstract_method|
      it "throws an exception if #{abstract_method} is invoked" do
        expect { 
          Parser.new(StringIO.new("")).send(abstract_method) }.to raise_error(Farse::MustSubclassError)
      end
    end
    
    %w(Csv Pipe Space).each do |type|
      it "detects a #{type} file" do
        Parser.build_for(File.open("spec/fixtures/#{type.downcase}")).should be_a(Farse::Parsers.const_get(type))
      end
    end
    
    it "rewinds the io after testing the first line" do
      csv_file = File.open("spec/fixtures/csv")
      Parser.build_for(csv_file)
      csv_file.pos.should eq(0)
    end
  end
end