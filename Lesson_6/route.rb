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
