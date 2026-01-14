# This is the (partial) Graph class. Only representing the possible moves from a specific root position
class Graph
  def initialize(starting_pos = [0, 0])
    @root = Node.new(starting_pos, nil)
  end

  def find_path(start_pos, end_pos) # rubocop:disable Metrics/MethodLength
    queue = [Node.new(start_pos, nil)]
    visited = [start_pos]

    while queue.any?
      current_node = queue.shift

      return current_node if current_node.pos == end_pos

      current_node.children.each do |child|
        unless visited.include?(child)
          visited << child
          queue << Node.new(child, current_node)
        end
      end
    end
  end

  def shortest_route_to(end_pos)
    node_at_end_pos = find_path(@root.pos, end_pos)
    path = []
    current = node_at_end_pos
    while current
      path.unshift(current.pos)
      current = current.parent
    end
    [path.size - 1, path]
  end

  def pretty_print
    puts "\n--- Graph Structure (Root: #{@root.pos}) ---"
    # We pass an empty Set to track visited nodes and prevent infinite loops
    print_node(@root, "", Set.new)
    puts "------------------------------------------\n"
  end

  private

  def print_node(node, prefix, visited)
    # Check if we've seen this node already to handle cycles
    if visited.include?(node)
      puts "#{prefix}└── #{node.pos} (already visited)"
      return
    end

    visited.add(node)
    puts "#{prefix}└── #{node.pos}"

    # Prepare the prefix for child nodes
    # We add a "pipe" | if there are more neighbors to process
    child_prefix = prefix + "    "
    node.neighbors.each_with_index do |neighbor, index|
      print_node(neighbor, child_prefix, visited)
    end
  end
end
