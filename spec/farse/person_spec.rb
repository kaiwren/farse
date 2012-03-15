require 'spec_helper'

describe Farse::Person do
  let(:person) { Farse::Person.new("Abercrombie", "Neil", "Male", "Tan", DateTime.strptime("2/13/1943", "%m/%d/%Y")) }
  
  it "is equal to itself" do
    person.should eq(person)
  end
  
  it "is not equal to an object of a different class" do
    person.should_not eq(Object.new)
  end

  it "is not equal if the first names don't match" do
    person.should_not eq(
      Farse::Person.new("Foo", "Neil", "Male", "Tan", DateTime.strptime("2/13/1943", "%m/%d/%Y"))
    )
  end
  
  it "is not equal if the last names don't match" do
    person.should_not eq(
      Farse::Person.new("Abercrombie", "Foo", "Male", "Tan", DateTime.strptime("2/13/1943", "%m/%d/%Y"))
    )
  end
  
  it "is not equal if the genders don't match" do
    person.should_not eq(
      Farse::Person.new("Abercrombie", "Neil", "Foo", "Tan", DateTime.strptime("2/13/1943", "%m/%d/%Y"))
    )
  end
  
  it "is not equal if the colours don't match" do
    person.should_not eq(
      Farse::Person.new("Abercrombie", "Neil", "Male", "Foo", DateTime.strptime("2/13/1943", "%m/%d/%Y"))
    )
  end
  
  it "is not equal if the birthdays don't match" do
    person.should_not eq(
      Farse::Person.new("Abercrombie", "Neil", "Male", "Foo", DateTime.strptime("1/1/1970", "%m/%d/%Y"))
    )
  end
  
  it "is equal if all attributes match" do
    person.should eq(Farse::Person.new("Abercrombie", "Neil", "Male", "Tan", DateTime.strptime("2/13/1943", "%m/%d/%Y")))
  end
  
  it "has the same hashcode if equal" do
    person.hash.should eq(Farse::Person.new(
            "Abercrombie", "Neil", "Male", "Tan", DateTime.strptime("2/13/1943", "%m/%d/%Y")
          ).hash
        )
  end
end
