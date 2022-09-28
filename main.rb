require './tttgame.rb'
require './tttmod.rb'

def tttplay
  include TTTMod

  puts "Player 1"
  name1 = ask_name
  symbol1 = ask_symbol
  puts "Player 2"
  name2 = ask_name
  symbol2 = ask_symbol
  game = TTTGame.new
  iteration = -1
  info = [
    [name1, symbol1], [name2, symbol2]
  ]

  while !game.over? && !game.draw?
    iteration += 1
    turn = iteration / 2 + 1
    nplayer = iteration % 2
    # iteration even -> nplayer 0 -> player1 info
    # iteration odd -> nplayer 1 -> player2 info
    puts "Turn #{turn}: #{info[nplayer][0]}'s move"
    game.display
    input = ask_input(game.squares)
    game.put(input, info[nplayer][1])
  end

  if game.draw?
    puts "GAME OVER - IT'S A DRAW"
  else
    puts "GAME OVER - #{info[nplayer][0]} WINS"
  end

  puts "Play again? (y/any)"
  again = gets.chomp
  if again == 'y'
    tttplay
  end
end

tttplay
