Dir["lib/*.rb"].each { |file| require_relative file }

def knight_moves(from, to)
  # check if the squares are illegal
  if Square.illegal?(from)
    return "Starting square illegal!"
  elsif Square.illegal?(to)
    return "Ending square illegal!"
  end

  from = Square.new(from)
  to = Square.new(to)

  t = KnightTree.new(from)
  path, _ = t.find_path(to)
  path.flatten.reverse
end

system "clear"
puts "Moving the Knight from [0,0] to [7,7]:"
start_pos = [0,0]
end_pos = [7,7]

b = Board.new()
b.new_piece("Knight", "w", start_pos)

puts b

moves = knight_moves(start_pos, end_pos)

(moves.length-1).times do |n|
  puts
  b.move_piece(moves[n].square.pos, moves[n+1].square.pos)
  puts b
end
