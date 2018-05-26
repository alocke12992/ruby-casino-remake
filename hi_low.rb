require_relative 'deck'

class HiLo
    attr_accessor :player
    def initialize(player)
        @player = player
        @running = true
        @deck = Deck.new
        @deck.shuffle_cards
        @bet = 0
        @card
        run_game
    end
    def run_game
        puts "Welcome to Hi-Lo"
        while @running == true
            game_menu
        end
    end

    def game_menu 
        puts "---- Hi-Low ----\n---- Please Choose an Option ----"
        puts "1) Play Hi-Lo\n2)Return to Lobby"
        case gets.strip.to_i
        when 1
            start_game
        when 2 
            puts "Thanks for playing Hi-Lo\nCome again soon"
            @running = false
        else 
            puts "Please choose a valid option from the menu"
        end
    end

    def start_game
        @rounds = 1
        @card = @deck.cards.pop
        puts "Lets begin\n ---- Round One ----"
        puts "The first card is:\nThe #{@card.rank.keys[0]}, of #{@card.suit}"
        while @rounds <= 3
            puts "How much would you like to bet?"
            take_bet
            round
        end
    end

    def take_bet
        @bet = gets.strip.to_i
        if @bet > @player.wallet
            puts "You do not have enought to bet that much"
            start_game  
        else 
            @player.wallet -= @bet
        end
    end

    def round
        if @rounds > 1
            puts "---- Round #{@rounds} ----"
            puts "\nThe #{@card.rank.keys[0]}, of #{@card.suit}"
        end
        puts "Higher or Lower?\n1)Higher\n2)Lower"
        choice = gets.strip.to_i
        next_card = @deck.cards.pop
        puts "The next card is:\nThe #{next_card.rank.keys[0]}, of #{next_card.suit}"
        if choice == 1 
            if next_card.rank.values[0] > @card.rank.values[0]
                outcome = "win"
            elsif next_card.rank.values[0] == @card.rank.values[0]
                outcome = "tie"
            else
                outcome = "lose"
            end
        elsif choice == 2
            if next_card.rank.values[0] < @card.rank.values[0]
                outcome = "win"
            elsif next_card.rank.values[0] == @card.rank.values[0]
                outcome = "tie"
            else
                 outcome = "lose"
            end
        else 
            puts "Please choose a valid option"
            round
        end
        evaluate(outcome)
        @rounds = @rounds + 1
        @card = next_card
    end

    def evaluate(outcome)
        case outcome
        when "win"
            winnings = @bet * 0.5
            @player.wallet+=(winnings + @bet)
            puts "congrats! You won #{winnings}.\nYou now have #{@player.wallet} to bet with"
        when "lose"
            @player.wallet-=@bet
            puts "sorry, You lost #{@bet}.\nYou now have #{@player.wallet} to bet with"
        when "tie"
            @player.wallet+=@bet
            puts "It was a tie, you didn't win or lose anything."
        end
    end
end