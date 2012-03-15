require "spec_helper"

describe Farse do
  it "parses csv" do
    Farse.parse("spec/fixtures/csv").should eq([
          Farse::Person.new("Abercrombie", "Neil", "Male", "Tan", DateTime.strptime("2/13/1943", "%m/%d/%Y"))
      ])
  end
  
  it "closes opened files" do
    File.any_instance.should_receive(:close)
    Farse.parse("spec/fixtures/csv")
  end
end