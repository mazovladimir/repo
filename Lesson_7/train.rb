require_relative 'CompanyName'
require_relative 'InstanceCounter'

class Train
  NUMBER_FORMAT = /^(\d{3,}|[a-z]{3,})-?(\d{2,}|[a-z]{2,})$/i
  include CompanyName
  include InstanceCounter
  @@train_hash = {}
  attr_reader :speed, :vagon, :route, :type, :vagons, :number
  attr_writer :number
  def initialize(number,type,vagon)
    @number = number
    @type = type
    @vagon = vagon
    validate!
    @speed = 0
    @index_station = 0
    @vagons = []
    @@train_hash[self.number] = self
  end
  
  def valid?
    validate!
  rescue
    false
  end

  def route_inherit(path)
    @route = path.stationS
  end

  def vagon_attach(va)
      @vagons << va if vagon_allowed?(va) && @speed == 0
  end

  def self.find(number)
    @@train_hash[number]
  end

  def self.my_trains
    @@train_hash.keys
  end

  def vagon_detach(va)
    @vagons.delete(va) if @speed == 0 && @vagons.any?
  end

  def change_index(choice)
    @index_station = @route.index(choice)
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

  protected
  def validate!
    raise "Incorrect format of the number" if number !~ NUMBER_FORMAT
    raise "Please correct the number of vagons" if (vagon.to_i < 0) || (vagon.to_i > 20) || vagon.empty?
    true
  end
end
