class Plane

  def flying?
    @flying
  end

  def land
    @flying = false
  end

  def takeoff
    @flying = true
  end

  def status
    @flying == true ? "flying" : "landed"
  end


end

