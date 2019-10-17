require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bikes
  attr_accessor :capacity
  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike
   fail 'no bikes left' if empty?
   holder = @bikes.pop
   @bikes << holder
   fail 'broken bike' unless holder.working?
   @bikes.pop
  end

  def dock(bike)
   fail 'docking station at capacity' if full?
   @bikes << bike
   bike
  end

  private

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
     @bikes.empty?
  end



end
