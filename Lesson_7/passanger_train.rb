class PassangerTrain < Train
  def initialize(number, type, vagon, place)
    super(number, type, vagon)
    @place = place
    @all_place = place
  end

  def count_busy_place
    @busy_place = @all_place - @place
    puts "#{@busy_place} places is busy in the train"
  end

  def left_place
    puts "#{@place} places left in the train"
  end

  def take_place
    @place -= 1 if @place >= 1
  end

  protected

  def vagon_allowed?(va)
    va.class == PassangerVagon
  end

  def register_instance
    @count_inst = ObjectSpace.each_object(self).to_a.size += 1
  end
end
