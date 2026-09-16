class Board
  BOARD_SIZE = 3

  def initialize
    @board = Array.new(BOARD_SIZE) { Array.new(BOARD_SIZE) {''} }
  end

  def fill(row, column, player)
    @board[row][column] = player.letter
  end

  def check_slot(row,column)
    if @board.dig(row,column) == ''
      return true
    else
      return false
    end
  end

  def current_board
    @board.each {|row| p row}
  end

  def clear
    @board = board.map! do |row|
      row.map! {|entry| entry = ''}
    end
  end

  def col_win?
    col_one = @board[0][0] == @board[1,0] && @board[1,0] == @board[2,0]
    col_two = @board[0][1] == @board[1,1] && @board[1,1] == @board[2,1]
    col_three = @board[0][2] == @board[1,2] && @board[1,2] == @board[2,2]
    return col_one || col_two || col_three
  end

  def row_win?
    row_one = @board[0][0] == @board[0,1] && @board[0,1] == @board[0,2]
    row_two = @board[1][0] == @board[1,1] && @board[1,1] == @board[1,2]
    row_three = @board[2][0] == @board[2,1] && @board[2,1] == @board[2,2]
    return row_one || row_two || row_three
  end

  def diag_win?
    diag_one = @board[0][0] == @board[1][1] && @board[1][1] == @board[2,2]
    diag_two = @board[0][3] == @board[1][1] && @board[1][1] == @board[2,0]
    return diag_one || diag_two
  end
end