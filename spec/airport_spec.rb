require 'airport'
require 'plane'

describe Airport do
  let(:plane) {double :plane, land: false, take_off: true}
  let(:airport) {Airport.new}

context "During sunny weather" do
  before do
    allow(airport).to receive(:stormy).and_return false
  end

  it 'should dock a plane' do
    expect{airport.dock(plane)}.to change{airport.plane_count}.by 1
  end

  it "should land the plane once docked" do
    expect(plane).to receive(:land)
    airport.dock(plane)
  end

  it "should take off a plane when releasing" do
    airport.dock(plane)
    expect(plane).to receive(:take_off)
    airport.release(plane)
  end


  it 'should release a plane for take off' do
    airport.dock(plane)
    expect{airport.release(plane)}.to change{airport.plane_count}.by -1
  end

end


context "During stormy weather" do
   before do
    allow(airport).to receive(:stormy).and_return true
  end

  it 'should not allow a plane to land' do
    expect{airport.dock(plane)}.to raise_error(RuntimeError, 'Landing refused: It is not safe to land during stormy weather!')
  end

  it 'should not release a plane during stormy weather' do
    expect{airport.release(plane)}.to raise_error(RuntimeError, 'Take-off aborted: It is not safe to fly during stormy weather')
  end

end


end
