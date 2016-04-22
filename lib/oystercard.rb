require_relative 'journey_log'

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE    = 1
  ERR_MAX_BAL     = "Cannot exceed max of #{MAXIMUM_BALANCE}".freeze
  ERR_MIN_BAL     = "Insufficient funds".freeze

  attr_reader :balance, :entry_station, :journey_log #not needed
  attr_accessor :journeys

  def initialize(journey_log: JourneyLog.new)
    @balance = 0
    @journey_log = journey_log
  end

  def top_up(amount)
    raise "Cannot exceed the limit of #{MAXIMUM_BALANCE}" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    message = "Cannot touch in: not enough money for minimum fare of #{MINIMUM_FARE}"
    raise message if balance < MINIMUM_FARE
    journey_log.start(entry_station)
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    journey_log.finish(exit_station)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
