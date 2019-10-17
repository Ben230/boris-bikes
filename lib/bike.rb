class Bike
  def initialize
    @working = true
  end
  
  def working?
    @working
  end

  def report_bike
    @working = false
  end
end
