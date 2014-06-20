require 'pry-debugger'


# This class is complete. You do not need to alter this
class Card
  # Rank is the rank of the card, 2-10, J, Q, K, A
  # Value is the numeric value of the card, so J = 11, A = 14
  # Suit is the suit of the card, Spades, Diamonds, Clubs or Hearts
    attr_reader :value, :detail
    @@face_card = {
        11 => "Jack",
        12 => "Queen",
        13 => "King",
        14 => "Ace" }

    def initialize(value, suit)
        @value = value
        raise if value < 2 || value > 14
        @detail = @@face_card[value] ? "#{@@face_card[value]}" : value.to_s
        @detail += " of #{suit}"
    end
end

class Dealer

  attr_reader :deck

  def initialize
    @deck = Array.new()
  end

  # Reset this deck with 52 cards
  def create_52_card_deck
    new_deck = Array.new()
    values = Array(2..14)
    suits = ["Hearts", "Diamonds", "Clubs", "Spades"]
    suits.each do | suit |
      values.each do | value |
        new_deck << Card.new(value,suit)
      end
    end
    @deck = new_deck
  end

  # Mix around the order of the cards in your deck
  def shuffle # You can't use .shuffle!
    shuffled_deck = []
    (@deck.size-1).downto(1).each do | size |
      index = rand(size)
      shuffled_deck << @deck[index]
      @deck[index] = @deck[size]
    end
    shuffled_deck << @deck[0]
    @deck = shuffled_deck
  end

  def deal_hand
    return @deck.pop(@deck.size/2), @deck
  end
end

class Deck
  require_relative '../linked_list/linked_list.rb'
  attr_reader :deck

  def initialize(deck)
    @deck = Linklist.new(deck)
  end

  def add_card(card_array)
    card_array.each { |x| @deck.push(x) }
  end

  def deal_card
    @deck.shift
  end


# attr_reader :deck

# def initialize(deck)
#   @deck = {}
#   @next_card      = 0
#   @next_play_card = 0
#   add_card(deck)
#   puts deck
# end

# def deck_size
#   @deck.size
# end

# # Given a card, insert it on the bottom your deck
# def add_card(card_array)
#   card_array.each {|card| @deck[@next_card += 1] = card }
# end

# # Remove the top card from your deck and return it
# def deal_card
#   @deck.delete(@next_play_card += 1)
# end
end

class Card
end

# You may or may not need to alter this class
class Player
  attr_reader :name, :hand

  def initialize(name)
    @name = name
  end

  def hand=(hand)
    @hand = Deck.new(hand)
  end

end


class War
  def initialize(player1, player2)
    @dealer  = Dealer.new
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    
  end

  # You will need to play the entire game in this method using the WarAPI
  def play_game(run_game=1)
    # WarAPI.play_turn()
    start = Time.now
    max_times = 0
    min_times = 999999
    score = [0, 0]
    avg_counter = 0
    run_game.times do
      counter = 0
      # You will need to shuffle and pass out the cards to each player
      @dealer.create_52_card_deck()
      @dealer.shuffle()

      @player1.hand, @player2.hand = @dealer.deal_hand()
      
      while true
        counter += 1
        print counter, "  --  P1: ", @player1.hand.deck_size, " P2: ", @player2.hand.deck_size, "\n"
        if @player1.hand.deck_size == 0 || @player2.hand.deck_size == 0
          if @player1.hand.deck_size == 0
            score[1] += 1
          else
            score[0] += 1
          end
          break
        end
        return_hand = WarAPI.play_turn(@player1, @player1.hand.deal_card, @player2, @player2.hand.deal_card)
        #return_hand = WarAPI.play_turn(@player1.name, @player1.hand.deal_card, @player2.name, @player2.hand.deal_card)
        #binding.pry unless return_hand[@player1.name]
        #binding.pry unless return_hand[@player2.name]
        @player1.hand.add_card(return_hand[@player1.name])
        @player2.hand.add_card(return_hand[@player2.name])
      end
      
      max_times = counter if counter > max_times
      min_times = counter if counter < min_times
      avg_counter += counter

    end

    avg_time = (Time.now - start) / run_game
    puts "Average time: #{avg_time}"
    puts "Average moves: #{avg_counter / run_game}"
    puts "Max: #{max_times}"
    puts "Min: #{min_times}"
    puts "Final Score:"
    puts "#{@player1.name} #{score.join(" | ")} #{@player2.name}"
  end
end


class WarAPI
  # This method will take a card from each player and
  # return a hash with the cards that each player should receive
  def self.play_turn(player1, card1, player2, card2)
    binding.pry unless card1
    binding.pry unless card2
    if card1.value > card2.value
      {player1 => [card1, card2], player2 => []}
    elsif card2.value > card1.value || rand(100).even?
      {player1 => [], player2 => [card2, card1]}
    else
      {player1 => [card1, card2], player2 => []}
    end
  end
end
