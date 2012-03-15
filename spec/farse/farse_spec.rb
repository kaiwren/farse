require "spec_helper"

describe Farse do
  it "parses csv" do
    Farse.parse("fixtures/csv").should eq(
        Person.new("Abercrombie", "Neil", "Male", "Tan", DateTime.strptime("2/13/1943", "%m/%d/%Y"))
      )
  end
end