class Knight < Piece

  # class method for finding legal moves
  # from a square
  def self.legal_moves(square)
    row = square.pos[0]
    col = square.pos[1]

    squares = [
      Square.new([row+2, col+1]),
      Square.new([row+2, col-1]),
      Square.new([row-2, col+1]),
      Square.new([row-2, col-1]),
      Square.new([row+1, col+2]),
      Square.new([row+1, col-2]),
      Square.new([row-1, col+2]),
      Square.new([row-1, col-2]),
    ]
    squares = squares.delete_if do |s|
      s.illegal?
    end
    squares
  end

  def legal_moves
    # should return a list of possible moves from the current position
    moves = []
    row = @pos[0]
    col = @pos[1]

    moves = [
      [row+2, col+1], [row+2, col-1],
      [row-2, col+1], [row-2, col-1],
      [row+1, col+2], [row+1, col-2],
      [row-1, col+2], [row-1, col-2],
    ]
    moves = moves.delete_if do |p|
      p[0] < 0 or p[0] > 7 or p[1] < 0 or p[1] > 7
    end
    moves
  end

  def to_s
    if color == "w"
      "♞"
    else
      "♘"
    end
  end
end

