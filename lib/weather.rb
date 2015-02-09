class Weather

  def weather
    @forecast=["sunny", "sunny", "sunny", "stormy"].shuffle.pop
  end

  def stormy?
    @stormy = true
end

end
