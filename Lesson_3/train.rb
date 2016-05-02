class Station
  attr_reader :count 
  def initialize(name)
    @name = name
    @count = 0
  end

  def in_train
    @count += 1     
  end

  def out_train
    if @count > 0
      @count -= 1 
    else
      puts "Vagonov net"
    end
  end
end

class Route
  attr_reader :stationS
  def initialize(first,last)
    @stationS = [first, last]
  end

  def add_station(add_st)
    @stationS.insert(-2,add_st)
  end

  def delete_station(del_st)
    @stationS.delete(del_st)
  end
end

class Train
  attr_reader :speed, :vagon, :route
  def initialize
    @number = 902
    @type = "passanger"
    @vagon = 10
    @speed = 0
    @index_station = 0
  end

  def increase_speed
    @speed += 10
  end

  def break_speed
    @speed = 0
  end

  def vagon_attach
    if @speed == 0 && @type == "passanger"
      vP = PassangerVagon.new
      vP.pvagon_attach
    elsif @speed == 0 && @type == "cargo"
      vC = CargoVagon.new
      vC.cvagon_attach
    end
  end

  def vagon_detach
    if @speed==0 && @vagon>0
      @vagon-=1
    else
      puts "Vagonov net"
    end
  end

  def route_inherit(path)
    @route = path.stationS
  end

  def whatis_my_station
    puts "Before station is: #{@route[@index_station-1]}" if @index_station > 0
    puts "Current station is: #{@route[@index_station]}"
    puts "Next station is: #{@route[@index_station+1]}"
  end

  def next_station
    @index_station += 1 if @index_station < @route.count - 1
  end

  def before_station
    @index_station -=1 if @index_station > 0
  end
end

class PassangerTrain < Train
end

class CargoTrain < Train
end

class PassangerVagon < Train
  def initialize
    super
    @count_passanger = @vagon
  end

  def pvagon_attach
    @count_passanger+=1
  end
end
  
class CargoVagon < Train
  def initialize
    super
    @count_cargo = @vagon
  end

  def cvagon_attach
    @count_cargo+=1
  end
end
