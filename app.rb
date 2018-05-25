require_relative 'deck'
require_relative 'player'
require_relative 'hi_low'
require 'pry'
class App 
    attr_accessor :deck
    def initialize
        @deck = Deck.new
        @playing = true
        run_app
    end
    
    def welcome_menu
        puts "welcome to the casino!\n What is your name?"
        name = gets.strip
        puts "Welcome #{name}, we are happy you've joined us today.\n How much money did you bring with you today?"
        money = gets.strip.to_i
        @person = Player.new(name,money)
        puts "#{@person.name}, please enjoy your time at the casino"
    end

    def game_menu
        puts "Ruby Casino\nPlease choose an option"
        puts "1) Check Wallet\n2) Hi-Lo\n3)Exit"

        case gets.strip.to_i
        when 1
            puts "You currently have #{@person.wallet}"
        when 2
            HiLo.new(@person)
        when 3 
            puts "Thank you for coming.\n Please come again soon"
            @playing = false
        else 
            puts "Please choose a valid option from the menu"
        end
    end

    def run_app
        welcome_menu
        while @playing == true
            game_menu
        end
    end
end

App.new