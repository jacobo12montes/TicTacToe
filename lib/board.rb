require_relative '../lib/players'

class GameBoard
  attr_accessor :board
  attr_reader :wins

  def initialize(board)
    @board = board
    @wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [2, 4, 6], [0, 4, 8]]
  end

  def display_board
    "        #{@board[0]} | #{@board[1]} | #{@board[2]}
        -----------
        #{@board[3]} | #{@board[4]} | #{@board[5]}
        -----------
        #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def update_board(index, symbol)
    @board[index] = symbol
    board
  end

  def valid_move?(idx)
    if idx.between?(0, 8)
      true
    else
      false
    end
  end

  def winner?(_winner)
    if @wins.any? { |win| win.all? { |item| @board[item] == 'X' } }
      _winner = 1
    elsif @wins.any? { |win| win.all? { |item| @board[item] == 'O' } }
      _winner = 2
    end
  end
end
