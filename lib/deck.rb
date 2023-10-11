class Deck
    def initialize(cards)
        @cards = cards
    end

    def cards
        @cards
    end

    def count
        @cards.count()
    end

    def cards_in_category(category)
        @cards.select {|card| card.category == category}
    end
end