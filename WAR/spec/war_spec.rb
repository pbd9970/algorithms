require 'rubygems'
require 'rspec'
require 'pry-debugger'
require_relative '../war.rb'

describe 'Card' do
  it 'exists' do
    expect(Card).to be_a(Class)
  end

  it 'has a value' do
    card = Card.new(13,"Spades")
    expect(card.value).to eq(13)
  end

  it 'has a detail attribute' do
    card2 = Card.new(7,"Diamonds")
    expect(card2.detail).to eq("7 of Diamonds")
  end
end

describe 'Dealer' do
  it 'exists' do
    expect(Dealer).to be_a(Class)
  end
  describe '.initialize' do

    xit 'starts as an empty deck' do
      deck = Dealer.new()
      
      expect(deck.deck).to eq([])
    end

    xit 'can take a deck' do
      deck = Dealer.new
      deck.create_52_card_deck
      new_deck = Deck.new(deck)

      expect(new_deck.deck).to eq(deck.deck)
    end
  end

  describe '.create_52_card_deck' do
    xit 'can initialize a 52 card deck' do
      deck = Dealer.new
      deck.create_52_card_deck

      expect(deck.deck.size).to eq(52)
      expect(deck.deck.first).to be_a(Card)
    end
  end

  describe '.shuffle' do
    xit 'can shuffle the cards' do
      deck = Dealer.new
      deck.create_52_card_deck
      deck2 = Dealer.new
      deck2.create_52_card_deck

      expect(deck.deck.map{|d| d.detail}).to eq(deck2.deck.map{|d| d.detail})

      deck.shuffle
      expect(deck.deck.size).to eq(52)

      expect(deck.deck.map{|d| d.detail}).to_not eq(deck2.deck.map{|d| d.detail})

      expect(deck.deck.map{|d| d.detail}.sort).to eq(deck2.deck.map{|d| d.detail}.sort)
    end
  end

  describe '.deal_hand' do
    xit 'can deal two hands of 26 different cards' do
      deck = Dealer.new
      deck.create_52_card_deck
      deck.shuffle

      array1, array2 = deck.deal_hand

      expect(array1.size).to eq(26)
      expect(array2.size).to eq(26)

      array1.each do |card|
        expect(array2.find{|card2| card == card2 }).to eq(nil)
      end
    end
  
    describe '.deal_card' do
      xit "can deal a card" do
        deck = Deck.new
        deck.create_52_card_deck

        card = deck.deal_card

        expect(card.detail).to eq("Ace of Spades")

      end

      xit "will remove card from deck" do
        deck = Deck.new
        deck.create_52_card_deck

        card = deck.deal_card

        expect(deck.deck.size).to eq(51)
      end
    end

    describe '.add_card' do
      xit 'will add a card to the deck' do
        deck = Deck.new
        deck.add_card([Card.new(7,"Clubs"), Card.new(8,"Diamonds")])
        
        expect(deck.deck.size).to eq(2)
      end
    end
  end
end

describe 'Player' do
  it 'exists' do 
    expect(Player).to be_a(Class)
  end

  describe '.initialize' do
    it 'has a name' do
      player1 = Player.new("George Patton")

      expect(player1.name).to eq("George Patton")
    end
  end

  describe '.hand=' do
    it 'can get a hand dealt' do
      deck = Dealer.new
      deck.create_52_card_deck
      deck.shuffle
      hand1, hand2 = deck.deal_hand

      player2 = Player.new("Erwin Rommel")

      player2.hand = hand2
      
      puts player2.hand.deal_card

      expect(player2.hand.deck.values).to eq(hand2)
    end
  end
end

describe 'War' do
  it 'exists' do
    expect(War).to be_a(Class)
  end
  
  describe '.initialize' do
    it 'creates a game' do
      game = War.new("Patton", "Rommel")

      #???
    end
  end

  describe '.play_game' do
    it 'plays a game of war' do
      game = War.new("Patton", "Rommel")

      game.play_game
    end
  end
end

