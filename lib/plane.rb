class Plane

  def flying?
    @flying
  end

  def land
    @flying = false
  end

  def take_off
    @flying = true
  end

  def status
    @flying == true ? "flying" : "landed"
  end


end

