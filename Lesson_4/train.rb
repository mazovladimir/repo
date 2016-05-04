class Train
  attr_reader :speed, :vagon, :route, :type
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
