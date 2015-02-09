class Airport

# DEFAULT_CAPACITY = 6

  def planes
    @planes||=[]
  end

  def plane_count
    planes.count
  end

  def release(plane)
    planes.delete(plane)
  end

  def dock(plane)
    planes << plane
  end


end
