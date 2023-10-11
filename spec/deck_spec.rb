require './lib/card'
require './lib/deck'

RSpec.describe Deck do

  let(:card_1) { Card.new("What is the capital of Alaska?", "Juneau", :Geography) }
  let(:card_2) { Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM) }
  let(:card_3) { Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) }
  let(:cards) { [card_1, card_2, card_3] }

    it 'exists' do
      deck = Deck.new(cards)
  
      expect(deck).to be_instance_of(Deck)
    end

    it "stores cards in a deck" do
      deck = Deck.new(cards)

      expect(deck.cards).to contain_exactly(card_1, card_2, card_3)
    end

    it "counts number of cards in a deck" do
      deck = Deck.new(cards)

      expect(deck.count).to eq(3)
    end

    it "identifies cards in a deck with a specific category" do
      deck = Deck.new(cards)

      expect(deck.cards_in_category(:STEM)).to contain_exactly(card_2, card_3)
    end
end
  
    