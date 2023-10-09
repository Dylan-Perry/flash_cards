class Turn
    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def guess
        @guess
    end

    def card
        @card
    end

    def correct?
        if @guess.downcase.strip == (card.answer).downcase.strip
            return true
        else
            return false
        end
    end

    def feedback
        if @guess.downcase.strip == (card.answer).downcase.strip
            "Correct!"
        else
            "Incorrect."
        end
    end
end
        
