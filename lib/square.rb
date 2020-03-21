class Square

  attr_accessor :piece, :pos

  # class method to check for a legal square
  def self.illegal?(pos)
    !(pos[0] >= 0 and
    pos[0] <= 7 and
    pos[1] >= 0 and
    pos[1] <= 7)
  end

  def initialize(pos, piece=nil)
    @piece = piece
    @pos = pos
  end

  def illegal?
    !(@pos[0] >= 0 and
    @pos[0] <= 7 and
    @pos[1] >= 0 and
    @pos[1] <= 7)
  end

  def free?
    @piece == nil
  end

  # to compare the positions of two squares
  def equal_pos?(other)
    @pos == other.pos
  end

  def to_s
    # if the square is empty draw either black or white
    if @piece.nil?
      if (pos[0] + pos[1]) % 2 == 0
        "░"
      else
        "▓"
      end
    # otherwise draw the piece
    else
      @piece.to_s
    end
  end
end
