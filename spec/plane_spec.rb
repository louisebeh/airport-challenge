require 'plane'
require 'airport'

describe Plane do

  let(:plane) {Plane.new}

    it 'should be landed when created' do
      expect(plane).not_to be_flying
    end

    it 'should be able to take off' do
      plane.takeoff
      expect(plane).to be_flying
    end

    it 'should be able to land' do
      plane.land
      expect(plane).not_to be_flying
    end

    it 'should change status after take off' do
      plane.takeoff
      expect(plane.status).to eq "flying"
      end

    it 'should change status when landed' do
      plane.land
      expect(plane.status).to eq "landed"
    end

end
