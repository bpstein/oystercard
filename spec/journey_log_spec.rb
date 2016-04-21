require 'journey_log'

describe JourneyLog do 

  let(:journey) {double :journey} 
  let(:station) {double :station}
  let(:entry_station) {double :station}
  let(:entry_station2) {double :station}
  let(:exit_station) {double :station}
  subject(:journey_log) { described_class.new(journey_class: journey) }

  it "has an empty history" do
    expect(journey_log.journeys).to be_empty
  end

  it "starts a journey" do
    allow(journey).to receive(:entry_station) {entry_station}
    journey_log.start(journey)
    expect(journey_log.(entry_station)).to eq journey.entry_station
  end

  it "cannot start a new journey if the current journey is incomplete" do
    # allow(journey).to receive(:entry_station) {entry_station}
    # allow(journey).to receive(:exit_station) {exit_station}
    # journey_log.start(journey)
    # journey_log.update(exit_station)
    # #Need to test status of journey
    # expect(journey_log.current_journey(entry_station)).to eq entry_station
  end

  it "starts a new journey if there is no current journey" do 
    # allow(journey).to receive(:exit_station) {exit_station}
    # allow(journey).to receive(:entry_station) {entry_station}
    # journey_log.start(entry_station)
    # journey_log.update(exit_station)
    # journey_log.start(entry_station2)
    # expect(journey_log.current_journey(entry_station2)).to eq entry_station2
  end

  it "returns a list of all previous journeys" do 
  end


end