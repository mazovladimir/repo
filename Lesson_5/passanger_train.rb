class PassangerTrain < Train
  protected

  def vagon_allowed?(va)
    va.class == PassangerVagon
  end
end
