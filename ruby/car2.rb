#!/usr/bin/ruby -w

class Car

def initialize engine, tyres

@engine = engine
@tyres = tyres

end

def start
	puts "running"

end

def stop
	puts "stopped"
end



end

c = Car.new("new engine", [1,2,3,4])
puts c.inspect