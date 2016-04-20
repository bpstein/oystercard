require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:station) { double :station }
  let(:station) { double :station }
  context "when initialized" do
    it "has a balance equals to 0" do
      expect(oystercard.balance).to eq 0
    end

		it "is not in journey" do
			expect(oystercard).not_to be_in_journey
		end

    it "has no journey history by default" do
      expect(oystercard.journeys).to eq []
    end
  end

	describe "#top_up" do
		it "adds money to its balance" do
			expect { oystercard.top_up 1 }.to change{ oystercard.balance }.by 1
		end

		it "raises error if exceeding MAX amount" do
		  oystercard.top_up described_class::MAXIMUM_BALANCE
		  expect { oystercard.top_up 1 }.to raise_error "Cannot exceed the limit of #{described_class::MAXIMUM_BALANCE}"
		end
	end

	describe "#touch_in" do

    it "is expected to respond with its start station" do
    station = spy ('station')
    oystercard.top_up 1
    expect (oystercard.touch_in(station)).to eq station
    end

		it "responds to being touched in" do
			oystercard.top_up 1
			oystercard.touch_in(station)
			expect(oystercard).to be_in_journey
		end

		it "raise error if not enough balance" do
		  message = "Cannot touch in: not enough money for minimum fare of #{described_class::MINIMUM_FARE}"
		  expect { oystercard.touch_in(station) }.to raise_error message
		end

	end

	describe "#touch_out" do
		it "responds to being touched out" do
			oystercard.top_up 1
			oystercard.touch_in(station)
			oystercard.touch_out(station)
			expect(oystercard).not_to be_in_journey
		end

    it "deducts the minimum fare" do
      expect { oystercard.touch_out(station) }.to change { oystercard.balance }.by -described_class::MINIMUM_FARE
    end

    it "creates one journey on touch out" do
      oystercard.top_up 10
      oystercard.touch_in(station)
      oystercard.touch_out(station)
      expect(oystercard.journeys.length).to eq 1
    end
	end

  describe "#journeys" do
    it "gives a list of journeys" do
      oystercard.top_up 10
      wimbledon = Station.new('wimbledon', 4)
      blackfriars = Station.new('blackfriar', 1)
      oystercard.touch_in(wimbledon)
      oystercard.touch_out(blackfriars)
      expect(oystercard.journeys).to include({wimbledon => blackfriars})
    end
  end


end
