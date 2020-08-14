require './lib/board.rb'

describe 'GameBoard' do
    board = GameBoard.new((1..9).to_a)
    bad_board = GameBoard.new('abc')
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
end