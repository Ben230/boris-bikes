require_relative 'bike'

class DockingStation

 def release_bike
   fail 'no bikes left' unless @bike
   @bike
 end

 def dock(bike)
   @bike = bike
 end

 #def bike
 # @bike
 #end
 attr_reader :bike
end
