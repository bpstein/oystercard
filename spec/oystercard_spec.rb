require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }

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
end
