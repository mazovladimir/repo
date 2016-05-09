class Station
  @@my_stations = []
  attr_reader :count, :name, :my_trains
  def initialize(name)
    @name = name
    @count = 0
    @my_trains = []
    @@my_stations << self
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
