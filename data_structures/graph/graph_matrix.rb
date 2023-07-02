require 'pry'

=begin
  - In the graph, it does not matter in what order you get the output. What matters is, you must visit all the vertices in the graph.
  - So based on the starting vertex and the order of traversal you may get the different output.
  - Here the given input is matrix and we need to traverse whole matrix which mean all the rows and columns so time complexity will be O(n^2) and space complexity will be O(n) where n is number of vertices
=end
class GraphMatrix
  attr_reader :adj_matrix

  def initialize(num_vertices = nil)
    return if num_vertices.nil?
    # This will create 2-dimensional array.
    @adj_matrix = Array.new(num_vertices) { Array.new(num_vertices, 0) }
  end

  def add_edge(source, destination)
    @adj_matrix[source][destination] = 1
    #@adj_matrix[destination][source] = 1 # Uncomment this line for an undirected graph
  end

  def remove_edge(source, destination)
    @adj_matrix[source][destination] = 0
    #@adj_matrix[destination][source] = 0 # Uncomment this line for an undirected graph
  end

  def bfs(start_vertex, matrix)
    visited = {}
    queue = []
    cols = matrix[0].size
    puts start_vertex
    visited[start_vertex] = true
    queue.push(start_vertex)
    while !queue.empty?
      current_vertex = queue.shift
      (0...cols).each do |edge|
        if matrix[current_vertex][edge] == 1 && !visited[edge]
          puts edge
          visited[edge] = true
          queue.push(edge)
        end
      end
    end
  end

  def dfs(start_vertex, matrix)
    stack = []
    visited = {}
    stack.push(start_vertex)
    visited[start_vertex] = true
    while !stack.empty?
      current_vertex = stack.pop
      puts current_vertex

      (0...matrix.size).each do |neighbor|
        if matrix[current_vertex][neighbor] == 1 && !visited[neighbor]
          stack.push(neighbor)
          visited[neighbor] = true
        end
      end
    end
  end
end

matrix = [[0,1,0,1], [1,0,1,0], [0,1,0,1], [1,0,1,0]]

puts "===Generate Matrix===="
graph = GraphMatrix.new(4)
graph.add_edge(0,1)
puts graph

puts "====BFS==="
GraphMatrix.new.bfs(0, matrix)
puts "====DFS==="
GraphMatrix.new.dfs(0, matrix)