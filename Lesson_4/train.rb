class Train
  attr_reader :speed, :vagon, :route
  def initialize(number,type,vagon)
    @number = number
    @type = type
    @vagon = vagon
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
    @vagon+=1 if @speed == 0
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
