require 'journey'

describe Journey do

  subject(:journey) { described_class.new }
  let(:oystercard) {double :oystercard}
  let(:station) {double :station}

  it "starts a journey" do
    journey.start(station)
    expect(journey).to be_in_journey
  end

  it "ends a journey" do 
    journey.end(station)
    expect(journey).not_to be_in_journey 
  end

  it "is expected to respond with its start station" do  
    journey.start(station)
    expect(journey.entry_station).to eq station
  end

  it "is expected to respond with its exit station" do
    journey.end(station)
    expect(journey.exit_station).to eq station
  end

  it "returns the minimum fare" do 
    journey.start(station)
    journey.end(station)
    expect(journey.fare).to eq described_class::MINIMUM_FARE
  end

  it "returns a penalty fare if there was no entry station" do 
    journey.end(station)
    expect(journey.fare).to eq described_class::PENALTY_FARE
  end

  it "returns a penalty fare if there was no exit station" do 
    journey.start(station)
    expect(journey.fare).to eq described_class::PENALTY_FARE
  end

end
