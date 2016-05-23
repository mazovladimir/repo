require_relative 'company_name'
require_relative 'instance_counter'
require_relative 'station'
require_relative 'passanger_vagon'
require_relative 'cargo_vagon'

class Train
  include CompanyName
  include InstanceCounter
  NUMBER_FORMAT = /^(\d{3,}|[a-z]{3,})-?(\d{2,}|[a-z]{2,})$/i
  @@train_hash = {}
  attr_reader :speed, :vagon, :route, :type, :vagons, :number
  attr_writer :number
  def initialize(number, type, vagon)
    @number = number
    @type = type
    @vagon = vagon
    validate!
    @speed = 0
    @index_station = 0
    @vagons = []
    @@train_hash[self.number] = self
    vagon.to_i.times {|i| @vagons << PassangerVagon.new  } if @type == 'passanger'
    vagon.to_i.times {|i| @vagons << CargoVagon.new  } if @type == 'cargo'
  end

  def check_train_vagons
    vagons.each do |v|
      yield(v)
    end
  end

  def valid?
    validate!
  rescue
    false
  end

  def route_inherit(path)
    @route = path.stations
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

  def vagon_detach
    @vagons.pop if @speed == 0 && @vagons.any?
  end

  def change_index(choice)
    @index_station = @route.index(choice)
  end

  def whatis_my_station
    puts "Before station: #{@route[@index_station - 1]}" if @index_station > 0
    puts "Current station: #{@route[@index_station]}"
    puts "Next station: #{@route[@index_station + 1]}"
  end

  def current_station
    @route[@index_station]
  end

  def increase_speed
    @speed += 10
  end

  def break_speed
    @speed = 0
  end

  def next_station
    if @index_station < @route.count - 1
       @index_station += 1
    end
  end

  def before_station
    if @index_station > 0
       @index_station -= 1
    end
  end

  def train_list
    @route.each do |route|
      
    end
  end

  protected

  def validate!
    raise 'Incorrect format of the number' if number !~ NUMBER_FORMAT
    if (vagon.to_i < 0) || (vagon.to_i > 20) || vagon.empty?
      raise 'Incorrect number of vagons'
    end
    true
  end
end
