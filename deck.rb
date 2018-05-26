
require_relative 'card'

class Deck
  attr_accessor :cards

  def initialize
    @ranks = [{Ace: 1}, {Two: 2}, {Three: 3}, {Four: 4}, {Five: 5}, {Six: 6}, {Seven: 7}, {Eight: 8}, {Nine: 9}, {Ten: 10}, {Jack: 11}, {Queen: 12}, {King: 13}]
    @suits = %w(Spades Diamonds Clubs Hearts)
    @cards = []
    generate_deck
  end

  def generate_deck
    @suits.each do |suit|
      @ranks.each do |rank|
        color = (suit == 'Spades' || suit == 'Clubs') ? 'black' : 'red'
        @cards << Card.new(rank, suit, color)
      end
    end
  end

  def shuffle_cards
    @cards.shuffle!
  end
end