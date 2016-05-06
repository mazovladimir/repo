require_relative 'CompanyName'

class Train
  include CompanyName
  @@train_hash = {}

  attr_reader :speed, :vagon, :route, :type, :vagons, :number, :company
  def initialize(number,type,vagon)
    @number = number
    @type = type
    @vagon = vagon
    @speed = 0
    @index_station = 0
    @vagons = []
    @@train_hash[self.number] = self
  end

  def route_inherit(path)
    @route = path.stationS
  end

  def vagon_attach(va)
      @vagons << va if vagon_allowed?(va) && @speed == 0
  end

  def self.find
    puts @@train_hash
  end

  def vagon_detach(va)
    @vagons.delete(va) if @speed == 0 && @vagon > 0
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
