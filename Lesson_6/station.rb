class Station
  @@my_stations = []
  attr_reader :count, :name, :my_trains
  attr_writer :name
  def initialize(name)
    validate_station!
    @name = name
    @count = 0
    @my_trains = []
    @@my_stations << self
  end

  def valid_station?
    validate_station!
  rescue
    false
  end

  def validate_station!
    raise "Station should be a string" if !(name.is_a? String)
    raise "Station can't be empty" if name.nil?
    true
  end

  def self.all
    @@my_stations
  end
    
  def in_train(new_train)
    @count += 1
    @my_trains << new_train
  end

  def out_train
    if @count > 0
      @count -= 1
    else
      puts "Vagonov net"
    end
  end
end
