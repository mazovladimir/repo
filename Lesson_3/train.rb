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
  attr_reader :station
  def initialize(first,last)
    @first = first
    @last = last
    @station = [first, last]
  end

  def add_station(add_st)
    @station.insert(-2,add_st)
  end

  def delete_station(del_st)
    @station.delete(del_st)
  end
end

class Train < Route
  attr_reader :speed, :vagon
  def initialize(number,type,vagon)
    @number = number
    @type = type
    @vagon = vagon
    @speed = 0
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
end
