class Route
  attr_reader :stations
  def initialize(first, last)
    @stations = [first, last]
  end

  def add_station(add_st)
    @stations.insert(-2, add_st)
  end

  def delete_station(del_st)
    @stations.delete(del_st)
  end
end
