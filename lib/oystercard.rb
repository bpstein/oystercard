class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :entry_station
  attr_accessor :journeys

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise "Cannot exceed the limit of #{MAXIMUM_BALANCE}" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    message = "Cannot touch in: not enough money for minimum fare of #{MINIMUM_FARE}"
    raise message if balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    journey = {@entry_station => station}
    @journeys << journey 
    @entry_station = nil
  end

  def in_journey?
    @entry_station
  end

private

def deduct(amount)
  @balance -= amount
end

end
