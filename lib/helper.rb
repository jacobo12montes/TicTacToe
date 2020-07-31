def position_taken?(board, idx)
  if board[idx] == 'X' || board[idx] == 'O'
    true
  else
    false
  end
end

def valid_move?(board, position)
  idx = position - 1
  if idx.between?(0, 8) && !position_taken?(board, idx)
    true
  else
    false
  end
end

def invalid_move_prompt(current_player, game)
  winner = game.update_board(prompt_input(current_player), current_player.player_symbol, current_player)
  winner
end