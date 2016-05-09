class PassangerTrain < Train
  protected

  def vagon_allowed?(va)
    va.class == PassangerVagon
  end

  def register_instance
    @count_inst = ObjectSpace.each_object(self).to_a.size+=1
    puts @count_inst
  end
end

