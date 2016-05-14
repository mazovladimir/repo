class CargoTrain < Train
  def initialize(name,type,vagon,volume)
    @volume = volume
    @all_volume = volume
    super(name,type,vagon)
  end

  def take_volume(myvolume)
    @volume-=myvolume if @volume >= myvolume
  end

  def left_volume
    puts "#{@volume} volume left in the train"
  end

  def busy_volume
    @busy_volume = @all_volume - @volume
    puts "#{@busy_volume} volume busy in the train"
  end

  protected

  def vagon_allowed?(va)
    va.class == CargoVagon
  end
end
