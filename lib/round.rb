require 'pry'

class Round
    attr_reader :deck, :turns, :current_card
    
    def initialize(deck)
        @deck = deck
        @turns = []
        @current_card = @deck.cards.first
    end 
    
    def take_turn(guess)
        stored_turn = Turn.new(guess, @current_card)
        @turns << stored_turn
        @deck.cards.rotate!
        @current_card = @deck.cards.first
        stored_turn
    end

    def number_correct
        @correct_guesses = 0
        @turns.each do |turn|
            if turn.correct?
                @correct_guesses = @correct_guesses.next
            end
        end
        @correct_guesses
    end

    def number_correct_by_category(category)
        @correct_guesses_by_cat = 0
        @turns.each do |turn|
            if turn.correct? && turn.card.category == category
                @correct_guesses_by_cat = @correct_guesses_by_cat.next
            end
        end
        @correct_guesses_by_cat
    end

    def percent_correct
        self.number_correct
        @correct_guesses_percent = ((@correct_guesses.to_f)/(@turns.count.to_f)) * 100.0
    end

    def percent_correct_by_category(category)
        self.number_correct_by_category(category)
        @turns_in_category = 0
        @turns.each do |turn|
            if turn.card.category == category
                @turns_in_category = @turns_in_category.next
            end
        end
        @correct_guesses_percent_category = ((@correct_guesses_by_cat.to_f)/(@turns_in_category.to_f)) * 100.0
    end
end