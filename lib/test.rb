require './lib/oystercard'
require './lib/journey'
require './lib/station'

oyster = Oystercard.new
station1 = Station.new('Wimbledon', 3)
station2 = Station.new('Waterloo', 1)

oyster.top_up(50)
oyster.touch_in(station1)
oyster.touch_out(station2)
p oyster.journey_log.finish(station2)
p oyster.balance
puts 
oyster.touch_in(station2)
oyster.touch_out(station1)
p oyster.journey_log
p oyster.balance
oyster.touch_in(station1)
