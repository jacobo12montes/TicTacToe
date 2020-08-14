require './lib/board.rb'

describe 'GameBoard' do
    board = GameBoard.new((1..9).to_a)
    bad_board = GameBoard.new('abc')
    let(:idx) { 1 }
    let(:outside_idx) { 9 }
    let(:not_int_idx) { 'z' }
    board_winner_X = GameBoard.new(['X', 'X', 'X', 3, 4, 5, 6, 7, 8, 9])
    board_winner_O = GameBoard.new(['O', 'O', 'O', 3, 4, 5, 6, 7, 8, 9])
    _winner = nil

    describe '#display_board' do
        it 'Display an array in trhee lines' do
            expect(board.display_board).to be_a String
        end
    end

    describe '#update_board' do
        it 'transfor the item on one array' do
            expect(board.update_board(3,'X')).to eql([1,2,3,'X',5,6,7,8,9])
        end

        it 'transfor the item on one array' do
            expect(board.update_board(8,'O')).to eql([1,2,3,'X',5,6,7,8,'O'])
        end
    end

    describe '#valid_move?' do
        it 'should return true if passed a value in a range of 0 to 8.' do
            expect(board.valid_move?(idx)).to eql(true)
        end

        it 'should return false if passed a value outside the range of 0 to 8' do
            expect(board.valid_move?(outside_idx)).to eql(false)
        end
    end

    describe 'winner?' do
        it 'should return 1 if if player "X" is the winner' do
            expect(board_winner_X.winner?(_winner)).to eql(1)
        end

        it 'should return 1 if if player "O" is the winner' do
            expect(board_winner_O.winner?(_winner)).to eql(2)
        end
    end
end
