class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  attr_reader :entry_station, :exit_station

  def initialize(entry_station: nil)
    @entry_station = entry_station
    @exit_station = nil 
  end

  def in_journey?
    !!@entry_station
  end

  def end(station)
    @exit_station = station
    
  end

  def fare 
    @entry_station && @exit_station ? MINIMUM_FARE : PENALTY_FARE
  end

end