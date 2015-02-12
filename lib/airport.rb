require_relative 'weather'
include Weather

class Airport

  attr_reader :capacity,:planes

  def initialize
    @capacity = 6
    @planes||=[]
  end

  def plane_count
    planes.count
  end

  def release(plane)
    raise 'Take-off aborted: It is not safe to fly during stormy weather' if stormy
    plane.take_off
    planes.delete(plane)
  end

  def full?
    plane_count == capacity
  end

  def dock(plane)
    raise 'The airport is full! Pack your bags and take off!' if full?
    raise 'Landing refused: It is not safe to land during stormy weather!' if stormy
    plane.land

    @planes << plane
  end


end

