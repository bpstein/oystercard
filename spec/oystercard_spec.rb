require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:station) { double :station }
  let(:station) { double :station }
  context "when initialized" do
    it "has a balance equals to 0" do
      expect(oystercard.balance).to eq 0
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

		it "raise error if not enough balance" do
		  message = "Cannot touch in: not enough money for minimum fare of #{described_class::MINIMUM_FARE}"
		  expect { oystercard.touch_in(station) }.to raise_error message
		end
	end

	describe "#touch_out" do

    it "deducts the minimum fare" do
      expect { oystercard.touch_out(station) }.to change { oystercard.balance }.by -described_class::MINIMUM_FARE
    end
	end
end
