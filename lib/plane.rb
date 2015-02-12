class Plane

  def initialize
    @flying = false
  end

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
    @flying ? "flying" : "landed"
  end


end

