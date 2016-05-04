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
  def initialize(number,type,vagon)
    @number = number
    @type = type
    @vagon = vagon
    @speed = 0
    @index_station = 0
  end

  def route_inherit(path)
    @route = path.stationS
  end

  def vagon_attach(va)
    if @speed == 0
      @vagon+=1 if vagon_allowed?(va)
    end  
  end

  def vagon_detach(va)
    if @speed == 0
      @vagon-=1 if vagon_allowed?(va) && @vagon > 0
    end  
  end

  def whatis_my_station
    puts "Before station is: #{@route[@index_station-1]}" if @index_station > 0
    puts "Current station is: #{@route[@index_station]}"
    puts "Next station is: #{@route[@index_station+1]}"
  end

  def increase_speed
    @speed += 10
  end

  def break_speed
    @speed = 0
  end

  def next_station
    @index_station += 1 if @index_station < @route.count - 1
  end

  def before_station
    @index_station -=1 if @index_station > 0
  end
end

class PassangerTrain < Train
  protected

  def vagon_allowed?(va)
    va.class == PassangerVagon
  end
end

class CargoTrain < Train
  protected

  def vagon_allowed?(va)
    va.class == CargoVagon
  end
end

class PassangerVagon
end

class CargoVagon
end
