
class Calendar
  require 'singleton'
  require 'date'

attr_accessor :date

  def initialize()

    @date = 0

  end

  #Returns (as an integer) the current date.

  def get_date()

    now = DateTime.now
    @date = now
    puts "before converted to integer #{@date}"
    @date = @date.to_int
  end

  #Increment the date (move ahead to the next day), and returns the new date.

  def advance()

    @date = now.day + 1
    puts "It is #{now.day} today"

    puts "Tomorrow is #{now.day + 1} "


  end





end





datetest = Calendar.new
puts datetest.inspect


puts datetest.get_date