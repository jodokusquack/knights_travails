Dir["lib/*.rb"].each { |file| require_relative file }

def knight_moves(from, to)
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

puts knight_moves([0,0], [7,5]).join(", ")
puts knight_moves([0,0], [7,7]).join(", ")
