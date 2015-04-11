#!/usr/bin/env ruby

class Rectangle

def initialize (length, breadth)
@length = length
@breadth = breadth
end

def perimeter
2 * (@length + @breadth)
end

end

Rectangle.new(2, 3).perimeter