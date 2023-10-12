require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

RSpec.describe Round do

    let(:card_1) { Card.new("What is the capital of Alaska?", "Juneau", :Geography) }
    let(:card_2) { Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM) }
    let(:card_3) { Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM) }
    let(:cards) { [card_1, card_2, card_3] }
    let(:deck) { Deck.new(cards) }

        it "exists" do
            round = Round.new(deck)

            expect(round).to be_instance_of(Round)
        end

        it "contains a deck" do
            round = Round.new(deck)
    
            expect(round.deck).to eq(deck)
        end

        it "initializes an empty array called turns" do
            round = Round.new(deck)

            expect(round.turns).to eq([])
        end

        it "shows the first card in the deck as the current card" do
            round = Round.new(deck)

            expect(round.current_card).to eq(deck.cards.first)
        end

        it "takes a new turn with a guess of Juneau" do
            round = Round.new(deck)
            new_turn = round.take_turn("Juneau")

            expect(new_turn).to be_instance_of(Turn)
        end

        it "determines if the turn was correct" do
            round = Round.new(deck)
            new_turn = round.take_turn("Juneau")

            expect(new_turn.correct?).to eq true
        end  

        it "adds taken turn to the turns index" do
            round = Round.new(deck)
            new_turn_1 = round.take_turn("Juneau")
            new_turn_2 = round.take_turn("Venus")

            expect(round.turns).to contain_exactly(new_turn_1, new_turn_2)
        end

        it "counts the number of correct turns taken" do
            round = Round.new(deck)
            new_turn_1 = round.take_turn("Juneau")
            new_turn_2 = round.take_turn("Venus")

            expect(round.number_correct).to eq(1)
        end

        it "counts the number of correct turns in a given category" do
            round = Round.new(deck)
            new_turn_1 = round.take_turn("Juneau")
            new_turn_2 = round.take_turn("Venus")

            expect(round.number_correct_by_category(:Geography)).to eq(1)
            expect(round.number_correct_by_category(:STEM)).to eq(0)
        end

        it "gives the percent of correct turns" do
            round = Round.new(deck)
            new_turn_1 = round.take_turn("Juneau")
            new_turn_2 = round.take_turn("Venus")

            expect(round.percent_correct).to eq(50.0)
        end

        it "gives the percent of correct turns in a given category" do
            round = Round.new(deck)
            new_turn_1 = round.take_turn("Juneau")
            new_turn_2 = round.take_turn("Venus")

            expect(round.percent_correct_by_category(:Geography)).to eq(100.0)
        end

end

