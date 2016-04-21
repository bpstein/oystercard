class Journey

  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  attr_reader :entry_station, :exit_station

  def initialize
    @entry_station = nil
    @exit_station = nil 
  end

  def start(station)
    @entry_station = station
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