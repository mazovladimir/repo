class Station
  attr_reader :count
  def initialize(name)
    @name = name
    @count = 0
  end

  def in_train
    count += 1
  end

  def out_train
    if count > 0
      count -= 1
    else
      puts "Vagonov net"
    end
  end
end
