require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }

  context "when initialized" do
    it "has a balance equals to 0" do
      expect(oystercard.balance).to eq 0
    end
  end

end
