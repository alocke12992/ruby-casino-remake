class HiLo
    attr_accessor :player
    def initialize(player)
        @player = player
        @running = true
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
            @player.wallet-=50
            puts @player.wallet
        when 2 
            puts "Thanks for playing Hi-Lo\nCome again soon"
            @running = false
        else 
            puts "Please choose a valid option from the menu"
        end
    end
end