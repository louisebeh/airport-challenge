require_relative 'weather'
include Weather

class Airport

# DEFAULT_CAPACITY = 6
    attr_reader :capacity
    attr_reader :planes
    attr_reader :weather

  def initialize
    @capacity = 6
    @planes||=[]
    @stormy = weather.stormy
  end

  def plane_count
    @planes.count
  end

  def release(plane)
    raise 'Take-off aborted: It is not safe to fly during stormy weather' if stormy
    planes.delete(plane)
  end

  def release_sunny(plane)
    weather = !stormy
    planes.delete(plane)
  end

  def full?
    plane_count == capacity
  end

  def dock(plane)
    raise 'The airport is full! Pack your bags and take off!' if full?
    raise 'Landing refused: It is not safe to land during stormy weather!' if stormy
    @planes << plane
  end

  def dock_sunny(plane)
    weather = !stormy
    @planes << plane
  end

  #   def dock_6(plane)
  #   weather = !stormy
  #   @planes << [plane, plane, plane, plane, plane, plane]

  # end

end

