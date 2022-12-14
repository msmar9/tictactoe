# The consists on a board and methods to modify it
require './tttmod.rb'

class TTTGame
  include TTTMod

  attr_reader :squares

  def initialize
    @squares = NUMBERS
  end

  def display
    puts "
    +---+---+---+
    | #{@squares[6]} | #{@squares[7]} | #{@squares[8]} |
    +---+---+---+
    | #{@squares[3]} | #{@squares[4]} | #{@squares[5]} |
    +---+---+---+
    | #{@squares[0]} | #{@squares[1]} | #{@squares[2]} |
    +---+---+---+
    "
  end

  def over?
    WINNING_COMBINATIONS.reduce(false) do |boolean, combination|
      boolean = boolean || (
        (@squares[combination[0] - 1] == @squares[combination[1] - 1]) &&
        (@squares[combination[0] - 1] == @squares[combination[2] - 1])
      )
      boolean
    end
  end

  def put(input, symbol)
    @squares[input.to_i - 1] = symbol
  end

  def draw?
    @squares.reduce(true) do |boolean, value|
      boolean = boolean && !NUMBERS.include?(value.to_i)
      boolean
    end
  end
end

#-----------------------
# Testing
#game = TTTGame.new
#game.display
#p game.over?
#game.put(7,'x')
#game.put(5,'x')
#game.put(3,'x')
#game.display
#p game.over?
#game.put(8,'o')
#game.put(9,'o')
#game.put(4,'o')
#game.put(6,'o')
#game.put(1,'o')
#game.put(2,'o')
#game.display
#p game.draw?