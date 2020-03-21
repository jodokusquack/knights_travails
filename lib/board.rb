class Board

  def initialize()
    @board = create_new_board()
  end

  # the board is an 8x8 array of squares
  def create_new_board()
    board = []
    8.times do |row_number|
      row = []
      8.times do |col_number|
        row << Square.new(
          [row_number, col_number],
        )
      end
      board << row
    end
    board
  end

  # new_piece takes the piece as a String of the same name as the Class
  # you want to create
  def new_piece(piece, color, pos)
    square = @board[pos[0]][pos[1]]
    square.piece = Object.const_get(piece).new(pos, color)
  end

  # move_pieve takes two positions and moves a piece
  def move_piece(from, to)
    if Square.illegal? from
      puts "Starting square is out-of-bounds!"
      return false
    elsif Square.illegal? to
      puts "Ending square is out-of-bounds!"
      return false
    end

    start_square = @board[from[0]][from[1]]
    end_square = @board[to[0]][to[1]]

    if start_square.free?
      puts "No piece on Starting Square!"
      return false
    elsif !start_square.piece.legal_moves.include? to
      puts "Illegal move for piece!"
      return false
    end

    # if all checks go well, move the piece:
    # 1. Store the old piece in a variable
    beaten_piece = end_square.piece
    # 2. copy the piece to the new square
    end_square.piece = start_square.piece
    # 3. remove the old piece
    start_square.piece = nil
    # 4. update the position of the piece
    end_square.piece.pos = to

    # return the beaten piece
    beaten_piece
  end

  def to_s
    representation = ""
    @board.each do |row|
      representation << "[ "
      row.each do |square|
        representation << square.to_s
        representation << " "
      end
      representation << "]\n"
    end
    representation
  end
end

