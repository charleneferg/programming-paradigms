require 'test/unit'
require_relative 'simple.rb'

class TestLibrary < Test::Unit::TestCase


  library1 = Library.instance

  puts library1.inspect



  member1 = Member.new 'Shane', library1

  puts member1.inspect
  puts "The current member is #{member1.get_name}."
  puts 'testing'




    puts "#{library1.calendar.inspect}"
    calendar.get_date
    p "The current date is #{calendar.date} ."
    calendar.advance
    p "The current date is #{calendar.date} ."

=end

  #Test Create Book object and output Book methods

=begin
book = Book.new 1, 'Lord of the Rings', 'Tolkien'

puts book
puts "The current title is #{book.get_title}."
puts "The current author is #{book.get_author}."
puts "The current due date is #{book.get_due_date.to_i}."
=end



end