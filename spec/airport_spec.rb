require 'airport'
require 'plane'

describe Airport do
  let(:plane) {Plane.new}
  let(:airport) {Airport.new}
  # let(:weather){double :Weather, {stormy?: true}}


context "During sunny weather" do

  it 'should dock a plane' do
    airport.dock_sunny(plane)
    expect{airport.dock_sunny(plane)}.to change{airport.plane_count}.by 1
  end

  it 'should release a plane for take off' do
    airport.dock_sunny(plane)
    expect{airport.release_sunny(plane)}.to change{airport.plane_count}.by -1
  end

end


context "During stormy weather" do

  it 'should not allow a plane to land' do
    expect{airport.dock(plane)}.to raise_error(RuntimeError, 'Landing refused: It is not safe to land during stormy weather!')
  end

  it 'should not release a plane during stormy weather' do
    expect{airport.release(plane)}.to raise_error(RuntimeError, 'Take-off aborted: It is not safe to fly during stormy weather')
  end

end

# context "During the Grand Finale" do

#   it 'should dock & release 6 planes in sequence' do
#     airport.dock_6(plane)
#     expect{airport.dock_6(plane)}.to change{airport.plane_count}.by 6
#   end

    # airport.full

  #   # expect{airport.release(plane)}.to change{airport.plane_count}.by -6
  # # end
  # end

#   it 'should prevent 6 planes from landing if stormy' do
#     airport.weather
#     expect{6.times airport.dock(plane)}.to raise_error(RuntimeError, 'Landing refused: It is not safe to land during stormy weather!')
#   end

#   it 'should change all planes to flying status after takeoff' do
#     6.times plane.takeoff
#     expect(6.times plane.status).to eq "flying"
#   end

#   it 'should change all planes to landed status' do
#     6.times plane.land
#     expect(6.times plane.status).to eq "landed"
#   end


# end


# end



end
