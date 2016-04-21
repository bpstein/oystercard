require_relative 'journey'

class JourneyLog

  attr_reader :journey_class
  attr_accessor :current_journey

  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journeys = []
    @current_journey = {}
  end

  def start(entry_station)
    @journey_class = @journey_class.new(entry_station: entry_station)
    # update(@journey_class)
  end

  
  def finish(exit_station) 
    @journey_class.end(exit_station)
    update(@journey_class)
   end

  # def incomplete_journey
  #   @journey_class.in_journey? 
  # end

  def journeys 
    @journeys.dup
  end

  private

  def current_journey
    @current_journey || journey_class.new
  end

  def update(journey)
    @journeys << journey.dup
  end
end


# journeys[:exit_station] = exit_station
