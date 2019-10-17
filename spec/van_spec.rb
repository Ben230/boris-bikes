require 'van'
require 'bike'
require 'docking_station'

describe Van do
  describe '#pick_up' do
    it { is_expected.to respond_to :pick_up }

    it 'van picks up bikes' do
      bike = double(:bike, working?: false)
      expect(subject.pick_up(bike)).to eq bike
    end

    it 'van picks up bikes from docking station' do
      bike = double(:bike, working?: false)
      docking_station = DockingStation.new
      docked_bike = docking_station.dock(bike)
      expect(subject.pick_up(docked_bike)).to eq bike
    end

    it 'van only picks up broken bikes' do
      bike = double(:bike, working?: true)
      docking_station = DockingStation.new
      docked_bike = docking_station.dock(bike)
      expect { subject.pick_up(docked_bike) }.to raise_error 'bike is already fixed'
    end

  end
end
