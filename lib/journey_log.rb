require_relative 'journey'

class JourneyLog

  attr_reader :journey_class
  attr_accessor :current_journey

  def initialize(journey_class: Journey.new)
    @journey_class = journey_class
    @journeys = []
    @current_journey = {} 
  end

  def start(entry_station)
    @journey_class.start(entry_station)
  end
  
  def finish(exit_station) 
    @journey_class.end(exit_station)
    update(@journey_class)
    current_journey
   end

  def journeys 
    @journeys.dup
  end

  private

  def current_journey
    incomplete_journey || @journey_class = Journey.new
  end

  def incomplete_journey
    @journey_class if @journey_class.in_journey? 
  end

  def update(journey)
    @journeys << journey.dup
  end
end
