# This is the graph Node class
class Node
  attr_accessor :children, :parent
  attr_reader :pos

  def initialize(pos = [0, 0], parent = nil)
    @pos = pos
    @parent = parent
    @children = calculate_children
  end

  def calculate_children # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/MethodLength,Metrics/PerceivedComplexity
    next_positions = []
    x = @pos[0]
    y = @pos[1]
    next_positions.push([x - 2, y + 1]) if inrange(x - 2, y + 1)
    next_positions.push([x - 1, y + 2]) if inrange(x - 1, y + 2)
    next_positions.push([x + 1, y + 2]) if inrange(x + 1, y + 2)
    next_positions.push([x + 2, y + 1]) if inrange(x + 2, y + 1)
    next_positions.push([x - 2, y - 1]) if inrange(x - 2, y - 1)
    next_positions.push([x - 1, y - 2]) if inrange(x - 1, y - 2)
    next_positions.push([x + 1, y - 2]) if inrange(x + 1, y - 2)
    next_positions.push([x + 2, y - 1]) if inrange(x + 2, y - 1)
    next_positions
  end

  def inrange(x, y)
    (0..7).include?(x) && (0..7).include?(y)
  end
end
