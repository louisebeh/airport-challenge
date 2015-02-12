require 'plane'
require 'weather'
require 'airport'

describe 'Grand Finale' do
  let(:plane){Plane.new}
  let(:airport){Airport.new}
  let(:weather){Weather.new}

before(:each) { allow(airport).to receive(:stormy?).and_return(false) }

  it 'should dock & release 6 planes in sequence' do
    6.times {airport.dock(plane)}
    expect{airport.dock(plane)}.to change{airport.plane_count}.by 6
    airport.full
    expect{airport.release(plane)}.to change{airport.plane_count}.by -6
  end

  it 'should prevent 6 planes from landing if stormy' do
    airport.weather
    expect{6.times airport.dock(plane)}.to raise_error(RuntimeError, 'Landing refused: It is not safe to land during stormy weather!')
  end

  it 'should change all planes to flying status after takeoff' do
    6.times plane.takeoff
    expect(6.times plane.status).to eq "flying"
  end

  it 'should change all planes to landed status' do
    6.times plane.land
    expect(6.times plane.status).to eq "landed"
  end


end


describe 'The grand finale (last spec)' do

  let(:plane) {Plane.new}
  let(:airport) {Airport.new}

  before(:each) { allow(airport).to receive(:stormy?).and_return(false) }

    it '6 planes can land' do
      6.times {airport.land(plane)}
      expect(airport.landed_planes).to eq(6)
    end

    it 'every plane that lands knows it has landed' do
      6.times {airport.land(plane)}
      airport.planes.each {|plane| expect(plane.flying?).to eq(false)}
    end

    it 'when the airport is full, the alert is raise and every plane must take off' do
      6.times {airport.land(plane)}
      expect{ airport.land(plane) }.to raise_error 'Can\'t land, the airport is full'
      expect(airport.landed_planes).to eq(0)

    end
end