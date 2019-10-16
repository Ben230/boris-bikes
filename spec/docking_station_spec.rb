require 'docking_station'
require 'bike'

describe DockingStation do
  #it { is_expected.to respond_to :release_bike }

  #it "releases working bikes" do
  #  bike = subject.release_bike
  #  expect(bike).to be_working
  #end

  #it { is_expected.to respond_to :dock_bike.with(1).argument }
  it 'docks a bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

  describe '#releases_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      #release the bike we docked
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'no bikes left'
    end
  end

end
