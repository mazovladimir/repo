#loop do
#  puts "0. Create first and last station"
#  puts "1. Add station"
# puts "2. Create train"
#  puts "3. Add railway carriage to train"
#  puts "4. Detach railway carriage from train"
#  puts "5. Move train to the station"
#  puts "6. List trains on the station"
#  puts "7. Exit"
#
#  print "Choose the action: "
#  input = gets.chomp.to_i
#  break if input == 7
#
#  case input
#  when 0 
#    print "Please create the first station: "
#    fstation = gets.chomp.to_s
#    print "Please create the last station: "
#    lstation = gets.chomp.to_s
#    s = Route.new("fstation", "lstation")
#    puts s.stationS
#    puts "The stations was created"
#  
#  when 6
#     @stationS   
#  end
#end

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

  def vagon_detach
    if @speed==0 && @vagon>0 && @type == "passanger"
      @vagon-=1
    elsif @speed==0 && @vagon>0 && @type == "cargo"
      @vagon-=1
    end
  end

  def route_inherit(path)
    @route = path.stationS
  end

  def vagon_attach
    if @type == "passanger" && @speed == 0
      @vagon+=1
    elsif @type == "cargo" && @speed == 0
      @vagon+=1
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
  def vagon_attach
    super
  end
end

class CargoTrain < Train
  def vagon_attach
    super
  end
end
