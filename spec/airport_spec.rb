require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:plane) {Plane.new}
  let(:airport) {Airport.new}
  let(:weather){double :Weather, {stormy?: true}}

  it 'should dock a plane' do
    airport.dock(plane)
    expect{airport.dock(plane)}.to change{airport.plane_count}.by 1
  end

  it 'should release a plane for take off' do
    airport.dock(plane)
    expect{airport.release(plane)}.to change{airport.plane_count}.by - 1
  end

  it 'should prevent a plane from landing during stormy weather' do
    airport.Weather
    expect{airport.dock(plane)}.to raise_error(RuntimeError, 'Landing refused: It is not safe to land during stormy weather!')
  end

  it 'should prevent a plane from taking off during stormy weather' do
    airport.Weather
    expect{airport.takeoff(plane)}.to raise_error(RuntimeError, 'Take-off aborted: It is not safe to fly during stormy weather')
  end

end


# it 'should accept a bike' do
#     holder.dock(bike)
#     expect{holder.dock(bike)}.to change{holder.bike_count}.by 1
#   end

#   it 'should release a bike' do
#     holder.dock(bike)
#     expect{holder.release(bike)}.to change{holder.bike_count}.by -1
#   end