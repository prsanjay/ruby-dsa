require 'pry'

class Graph

  attr_accessor :adj_list

  def initialize
    @adj_list = {}
  end

  # Build the graph from the given edges so that you can perform a traversal on them.
  # the output will be : {source => [destination1, destination2]}
  # Space complexity will be O(|V| + 2|E|) where V is number of vertices and E is number of edges. Here, we mentioned, 2*|E| because, the edges can be 2-way, A->B and B->A
  def add_edge(source, destination)
    # Add the edge from source to destination
    if @adj_list[source]
      @adj_list[source] << destination
    else
      @adj_list[source] = [destination]
    end

    # Add the edge from destination to source (if undirected graph)
    if @adj_list[destination]
      @adj_list[destination] << source
    else
      @adj_list[destination] = [source]
    end
  end

=begin
  # It is similar to level order traversal in Binary tree
  # We need to use queue data structure to store the vertices which we need to explore
  # We need to store the visited vertices in another data structure
  # so the steps are visit the vertices, add to queue and explore other vertices
  # we only need to visit the vertices once
=end
  def bfs(start_vertex, adj_list)
    visited = {}
    queue = [start_vertex]

    while !queue.empty?
      current_vertex = queue.shift
      next if visited[current_vertex]

      visited[current_vertex] = true
      puts current_vertex
      adj_list[current_vertex].each do |neighbor|
        queue.push(neighbor) unless visited[neighbor]
      end
    end
  end

  def dfs(start_vertex, adj_list)
    visited = {}
    stack = [start_vertex]

    while !stack.empty?
      current_vertex = stack.pop
      next if visited[current_vertex]

      visited[current_vertex] = true
      puts current_vertex
      # Here we are using .reverse_each to visit the vertex in correct order.
      # Because, stack pushes element like 3,2,1 so 3 will pop-up first. If we reverse then the vertex will get pushed 1,2,3
      adj_list[current_vertex].reverse_each do |neighbor|
        stack.push(neighbor) unless visited[neighbor]
      end
    end
  end
end

# Program execution starts

# These are the edges. Which mean, you can go from 1->2 and 2->3 and so on..
edges = [[1, 2], [2, 3], [3, 4], [4, 1], [1, 3]]

graph = Graph.new

edges.each do |edge|
  source, destination = edge
  graph.add_edge(source, destination)
end

# Print the adjacency list representation of the graph
graph.adj_list.each do |vertex, neighbors|
  puts "Vertex #{vertex}: #{neighbors.join(', ')}"
end
puts "====== bfs_with_adj_list ====="
adj_list = { 1 => [2,3,4], 2 => [1,3,4], 3 => [1,2], 4 => [1,3] }
graph.bfs(1, adj_list)
puts "==== dfs_with_adj_list ==== "
graph.dfs(1, adj_list)






