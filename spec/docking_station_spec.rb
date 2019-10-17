require 'docking_station'
require 'bike'

describe DockingStation do

  describe '#dock' do
    it 'docks a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes[0]).to eq bike
    end

    it 'raises an error when full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error 'docking station at capacity'
    end


  end


  describe '#releases_bike' do
    it { is_expected.to respond_to :release_bike }

    it 'does not release broken bikes' do
      bike = Bike.new
      bike.report_bike
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'broken bike'
    end

    it "releases working bikes" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end

    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'no bikes left'
    end
  end

  describe '#bikes' do
    it 'shows bikes in the docking station' do
      bike1 = Bike.new
      bike2 = Bike.new
      subject.dock(bike1)
      subject.dock(bike2)
      expect(subject.bikes).to eq [bike1, bike2]
    end

  end

  describe '#capacity' do
    it 'user can change capacity using .capacity' do
      subject.capacity = 26
      expect(subject.capacity).to eq 26
    end

    it 'has a default capacity of 20' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

end
