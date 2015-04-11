# ask for age

age = gets.to_i

output = if age < 10
	puts "It's a young person"
elseif age < 19
	puts "It's a teenager"
else
	puts "It's an older person"
end

#ternary 

variable = age < 45 ? "young": "old"

doSomething if condition == true

doSomething unless condition == false


puts output
