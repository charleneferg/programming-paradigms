class Car

  attr_accessor :state

  def initialize engine, tyres
    @engine = engine
    @tyres = tyres
  end

  def start
    @state = "running"
    p "The car has started"
  end

  def stop
    @state = "stopped"
    p "The car has stopped"
  end

end

car = Car.new "My engine", [1,2,3,4]
puts car
puts car.inspect

car.start
p "The current car's state is #{car.state}"
car.stop
p "The current car's state is #{car.state}"