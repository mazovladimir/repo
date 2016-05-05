class CargoTrain < Train
  protected

  def vagon_allowed?(va)
    va.class == CargoVagon
  end
end
