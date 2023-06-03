=begin

Input:
|1 2 3|
|4 5 6|
|7 8 9|

Output:
|1 4 7|
|2 5 8|
|3 6 9|

Approach

1. Traverse the matrix by column-wise and fill each element in row
2. Push that row to result array

=end

def transposion(matrix)
  rows = matrix.size
  cols = matrix[0].size
  result = []

  (0...cols).each do |i|
    row = []
    (0...rows).each do |j|
      row << matrix[j][i]
    end
    result << row
  end
  result
end

matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]
p transposion(matrix)