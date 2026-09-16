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

  def col_win
    if col_one = @board[0][0] == @board[1,0] && @board[1,0] == @board[2,0]
      return 'col_one'
    elsif col_two = @board[0][1] == @board[1,1] && @board[1,1] == @board[2,1]
      return 'col_two'
    elsif col_three = @board[0][2] == @board[1,2] && @board[1,2] == @board[2,2]
      return 'col_three'
    end
    return nil
  end

  def row_win
    if row_one = @board[0][0] == @board[0,1] && @board[0,1] == @board[0,2]
      return 'row_one'
    elsif row_two = @board[1][0] == @board[1,1] && @board[1,1] == @board[1,2]
      return 'row_two'
    elsif row_three = @board[2][0] == @board[2,1] && @board[2,1] == @board[2,2]
      return 'row_three'
    end
    return nil
  end

  def diag_win
    if diag_one = @board[0][0] == @board[1][1] && @board[1][1] == @board[2,2]
      return 'diag_one'
    elsif diag_two = @board[0][3] == @board[1][1] && @board[1][1] == @board[2,0]
      return 'diag_two'
    end
    return nil
  end

  
end