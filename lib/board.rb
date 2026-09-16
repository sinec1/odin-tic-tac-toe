class Board
  BOARD_SIZE = 3

  def initialize
    @board = Array.new(BOARD_SIZE) { Array.new(BOARD_SIZE) {''} }
  end

  def fill(row, column, player)
    @board[row][column] = player.symbol
  end

  def currentBoard
    @board.each {|row| p row}
  end

  def clear
    @board = board.map! do |row|
      row.map! {|entry| entry = ''}
    end
  end
end