require_relative '../lib/board'
require_relative '../lib/players'
require_relative '../lib/helper'

puts 'Welcome To TicTacToe'

puts 'Please enter your name:'
player1_name = gets.strip

puts 'Please enter your name:'
player2_name = gets.strip

turn = 0

# Object Creation.
player_one = Player.new(player1_name, 'X')
player_two = Player.new(player2_name, 'O')
$game = GameBoard.new

def return_winner(_board, player_move, current_player)
  if valid_move?($game.board, player_move)
    $game.update_board(player_move, current_player.player_symbol, current_player)
  else
    invalid_move_prompt(current_player)
  end
end

def switch_turn(turn, player1, player2)
  current_player = nil
  winner = nil
  if turn.even?
    current_player = player1
    winner = return_winner($game.board, prompt_input(current_player), current_player)
  else
    current_player = player2
    winner = return_winner($game.board, prompt_input(current_player), current_player)
  end
  winner
end

puts $game.display_board
while turn <= 8
  winner = switch_turn(turn, player_one, player_two)
  puts turn
  puts $game.display_board

  if winner
    puts "#{winner.player_name} is the winner."
    break
  elsif $game.board_filled?($game.board)
    puts "It's a draw guys."
    break
  end
  turn += 1
end
