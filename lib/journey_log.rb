require_relative 'journey'

class JourneyLog

  attr_reader :journey_class
  attr_accessor :current_journey

  def initialize(journey_class: nil)
    @journey_class = journey_class
    @journeys = []
    @current_journey = {}
  end

  def start(entry_station)
    @current_journey[:entry_station] = entry_station
    # @journey_class.new(entry_station: entry_station)
  end

  def update(journey)
    @journeys << journey.dup
  end

  def finish(exit_station) 
    # @journey_class ||= @journey_class.new
    # @journey_class.end(exit_station)
    @current_journey[:exit_station] = exit_station
  end

  def incomplete_journey
    @journey_class.in_journey? 
  end

  def journeys 
    @journeys.dup
  end

  # private

  # def current_journey
  #   @current_journey || journey_class.new
  # end

end

