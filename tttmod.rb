# The input we are going to be working with is always a 1-char string
module TTTMod
  NUMBERS = (1..9).to_a

  WINNING_COMBINATIONS = [
    [7, 8, 9], [4, 5, 6], [1, 2, 3], 
    [7, 4, 1], [8, 5, 2], [9, 6, 3], 
    [7, 5, 3], [9, 5, 1]
  ]

  def ask_name
    # Returns a string with the player's name
    puts "Your name:"
    name = gets.chomp
    name
  end
  
  def valid_symbol?(symbol)
    # Returns a boolean based on the validity of the symbol (a string)
    (symbol.length == 1) && !NUMBERS.include?(symbol.to_i)
  end

  def ask_symbol
    # Returns a string with the player's symbol
    puts "Your symbol:
    (Must be a single char that is not a digit different from 0)"
    symbol = gets.chomp
    def another_symbol
      puts "Choose a valid symbol:
      (Must be a single char that is not a digit different from 0)"
      symbol = gets.chomp
      symbol = valid_symbol?(symbol) ? symbol : another_symbol
      symbol
    end
    symbol = valid_symbol?(symbol) ? symbol : another_symbol
    symbol
  end

  def valid_input?(input, current_board)
    # Returns a boolean based on the validity of the input (a string
    # signaling a position on the board) and the current board (an array of integers)
    current_board.include?(input.to_i) && (input.to_i != 0)
  end

  def ask_input(current_board)
    # Returns a valid position (string)
    puts "Your move:"
    input = gets.chomp
    def another_input(current_board)
      puts "Choose a valid move:"
      input = gets.chomp
      input = valid_input?(input, current_board) ? input : another_input(current_board)
      input
    end
    input = valid_input?(input, current_board) ? input : another_input(current_board)
    input
  end

end

#----------------------------
# Testing
#include TTTMod
#p ask_name
#p valid_symbol?('x') == true
#p valid_symbol?('6') == false
#p valid_symbol?('0') == true
#p valid_symbol?('00') == false
#p ask_symbol
#p board = ['x',2,3,4,5,6,'o',8,9]
#p valid_input?('x',board) == false
#p valid_input?('5',board) == true
#p valid_input?('1',board) == false
#p ask_input(board)