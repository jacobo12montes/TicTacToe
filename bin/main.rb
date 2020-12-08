require_relative '../lib/board'
require_relative '../lib/players'

puts 'Wellcome to TicTacToe'
puts 'Player1 enter your name'
player1_name = Player.new(gets.strip, 'X')
puts 'Player2 enter your name'
player2_name = Player.new(gets.strip, 'O')
board = GameBoard.new((1..9).to_a)
winner = nil
current_player = player1_name
counter = 1
while winner.nil?
  puts board.display_board
  puts "#{current_player.player_name} Pick a number"
  idx = gets.strip.to_i - 1
  if board.valid_move?(idx)
    symbol = current_player.player_symbol
    board.update_board(idx, symbol)
    if board.winner?(winner) == 1
      winner = player1_name
      puts "the winner is #{player1_name.player_name}"
    elsif board.winner?(winner) == 2
      winner = player2_name
      puts "the winner is #{player2_name.player_name}"
    end
    counter += 1
    if counter > 9 && winner.nil?
      puts 'Its a draw'
      break
    end
    current_player = if current_player.eql?(player1_name)
                       player2_name
                     else
                       player1_name
                     end
  else
    puts 'Invalid move'
  end
end
puts board.display_board
