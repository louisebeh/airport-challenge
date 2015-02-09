module Weather

attr_reader :weather

  def stormy
    rand(1) < 0.2 ? true : false
  end


end
