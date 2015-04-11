print " Tell me a car module: "
car_model = gets.strip

output = case car_model
		when "Focus", "Fiesta" then "Ford"
		when "Ibiza" then "Seat"
		when "Civic" then "Honda"
		else "Unknown model"
		end

puts "The car company for #{car_model} is" ,  output 
