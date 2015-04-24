require 'test/unit'

class First_Unit_Test
  def cap(name)
    name.upcase
  end
end



class My_test < Test::Unit::TestCase
 def test_basic
   #first arguement is expected result
   #second is what you would like the function to do

   # This test fails, function changes Charlie to CHARLIE
   #assert_equal("Charlie",First_Unit_Test.new.cap("Charlie"))

   # This test passes, function changes charlie to CHARLIE
   assert_equal("CHARLIE", First_Unit_Test.new.cap("charlie"))
 end

 exception = assert_raise(ParserError) {parse_verb(list_two)}
 assert_equal("The library is not open!", exception.message)



end


Exception Tests
assert_raise do #Fails, no Exceptions are raised
end

assert_raise NameError do
  puts x  #Raises NameError, so assertion succeeds


def test_age
    person = Person.new('J', 'Y', 25)
    assert_equal 25, person.age
    assert_raise(ArgumentError) { Person.new('J', 'Y', -4) }
    assert_raise(ArgumentError) { Person.new('J', 'Y', 'four') }
  end