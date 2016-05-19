class Station
  @@my_stations = []
  attr_reader :count, :name, :my_trains, :my_name
  attr_writer :name, :my_name
  def initialize(name)
    @name = name
    validate_station!
    @count = 0
    @my_trains = []
    @@my_stations << self
  end

  def list_train_station
    @my_trains.each do |x|
      yield(x)
    end
  end

  def valid_station?
    validate_station!
  rescue
    false
  end

  def validate_station!
    raise 'Station should be a string' unless name.is_a? String
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

  def delete_train(remove_train)
    @my_trains.delete(remove_train)
  end

  def out_train
    if @count > 0
      @count -= 1
    else
      puts 'Vagonov net'
    end
  end
end
