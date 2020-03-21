class KnightNode

  attr_accessor :neighbours, :square
  def initialize(square)
    @square = square
  end

  def children
    children = []
    Knight.legal_moves(@square).each do |square|
      children << KnightNode.new(square)
    end

    children
  end

  def to_s
    @square.to_s
  end
end
