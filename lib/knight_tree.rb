class KnightTree

  def initialize(square)
    @root = KnightNode.new(square)
  end

  def find_path(
    goal,
    current=[@root, nil],   # current is an array of the node and it's parent
    path=[],
    visited=[],
    queue=[]
  )
    # puts "Find path called:"
    # puts "goal: #{goal}"
    # puts "current: #{current}"
    # puts "path: #{path}"
    # puts "visited: #{visited}"
    # puts "queue: #{queue}"

    # base case
    if current[0].square.equal_pos? goal
      # puts "Found it! Adding #{current} to path"
      path << current[0]
      return path, current[1]
    end

    # if the square wasn't found:
    # 1. add the current node to the array
    # of already visited nodes
    visited << current

    # 2. add all neighbours to the queue
    # but only if they weren't visited before
    current[0].children.each do |child|
      if visited.include? child
        next
      else
        queue << [child, current]
      end
    end

    # 3. call find_path recursively
    path, previous_parent = find_path(
      goal,          # the goal stays the same
      queue.shift,   # the new current gets taken from the queue
      path,
      visited,
      queue
    )

    # 4. Add the current to the path if current is equal to the
    # parent of the previous node
    if current == previous_parent
      path << current[0]
      return path, current[1]
    else
      return path, previous_parent
    end
  end
end
