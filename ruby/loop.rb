number = 0

loop do 
	break if number > 15
	puts "The number inside the loop is #{number}"
	number += 1
	
end

until number > 15 do
	puts "The number inside the loop is #{number}"
	number += 1
end

while number <= 15 do
	puts "The number inside the loop is #{number}"
	number += 1
end


#blocks examples

16.times do |number|
	puts "The number inside the loop is #{number}"
end

list = [0,1,2,3,4,5]

list.each do |number|
	puts "The number inside the loop is #{number}"
end

#range object which includes Enumerable module


(0..15).each do |number|
 puts "The number inside the loop is #{number}"
end

# use three dots and this excludes the last number.

0...16).each do |number|
 puts "The number inside the loop is #{number}"
end


for number in 0..15 do
	puts "The number inside the loop is #{number}"
end
