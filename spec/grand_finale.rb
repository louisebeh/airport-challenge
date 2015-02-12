require 'plane'
require 'weather'
require 'airport'

describe 'Grand Finale' do
  let(:plane){Plane.new}
  let(:airport){Airport.new}
  let(:weather){Weather.new}

context "During sunny weather" do
  before do
    allow(airport).to receive(:stormy).and_return false
  end

  it 'should dock & release 6 planes in sequence' do
    6.times {airport.dock(plane)}
    expect{airport.dock(plane)}.to change{airport.plane_count}.by 6-
    airport.full
    expect{airport.release(plane)}.to change{airport.plane_count}.by -6
  end

  it 'should change all planes to flying status after takeoff' do
    6.times plane.takeoff
    expect(6.times plane.status).to eq "flying"
  end

  it 'should change all planes to landed status' do
    6.times plane.land
    expect(6.times plane.status).to eq "landed"
  end

context "During stormy weather" do
  before do
    allow(airport).to receive(:stormy).and_return true
  end

  it 'should prevent 6 planes from landing if stormy' do
    airport.weather
    expect{6.times airport.dock(plane)}.to raise_error(RuntimeError, 'Landing refused: It is not safe to land during stormy weather!')
  end


end

