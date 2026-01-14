require_relative "ruby_knights_travails/version"
require_relative "ruby_knights_travails/node"
require_relative "ruby_knights_travails/graph"

# Main app
class MyApp
  def initialize; end

  def knight_moves(start_pos, end_pos)
    graph = Graph.new(start_pos)
    route = graph.shortest_route_to(end_pos)
    puts "\nYou made it from #{start_pos} to #{end_pos} in #{route[0]} moves! Here's your path:"
    p route[1]
  end
end

# Running the code
MyApp.new.knight_moves([0, 0], [3, 3])
MyApp.new.knight_moves([3, 3], [0, 0])
MyApp.new.knight_moves([0, 0], [7, 7])
