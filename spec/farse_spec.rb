require "spec_helper"

describe Farse do
  it "parses csv" do
    Farse.parse("spec/fixtures/csv").should eq([
          Farse::Person.new("Abercrombie", "Neil", "", Farse::Person::MALE, "Tan", DateTime.strptime("2/13/1943", "%m/%d/%Y")),
          Farse::Person.new("Haddock", "Archibald", "", Farse::Person::MALE, "Red", DateTime.strptime("5/13/1890", "%m/%d/%Y"))
      ])
  end
  
  it "parses pipe" do
    Farse.parse("spec/fixtures/pipe").should eq([
          Farse::Person.new("Smith", "Steve", "D", Farse::Person::MALE, "Red", DateTime.strptime("3/3/1985", "%m/%d/%Y")),
          Farse::Person.new("Haddock", "Archibald", "P", Farse::Person::MALE, "Red", DateTime.strptime("5/13/1890", "%m/%d/%Y"))
      ])
  end

  it "parses space" do
    Farse.parse("spec/fixtures/space").should eq([
          Farse::Person.new("Kournikova", "Anna", "F", Farse::Person::FEMALE, "Red", DateTime.strptime("6/3/1975", "%m/%d/%Y")),
          Farse::Person.new("Haddock", "Archibald", "P", Farse::Person::MALE, "Red", DateTime.strptime("5/13/1890", "%m/%d/%Y"))
      ])
  end
  
  it "closes opened files" do
    File.any_instance.should_receive(:close)
    Farse.parse("spec/fixtures/csv")
  end
end