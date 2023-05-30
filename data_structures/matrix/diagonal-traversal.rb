
# |1 2 3|
# |4 5 6|
# |7 8 9|

# The output should be: [1, 2, 4, 3, 5, 7, 6, 8, 9]

# Intuition/Approach:
=begin
1. First traverse upper left diagonal and push element to result array.
2. Then traverse lower right diagonal and push element to result array.
=end

def traverse(matrix)
  rows = matrix.size
  cols = matrix[0].size
  result = []

  # Traverse the upper-left half of the matrix
  (0...cols).each do |k|
    i=0
    j=k
    while j >=0 && i < rows
      result << matrix[i][j]
      i += 1
      j -= 1
    end
  end

  # Traverse the bottom-right half of the matrix
  (1...rows).each do |k|
    i=k
    j=cols-1
    while j >=0 && i < rows
      result << matrix[i][j]
      i += 1
      j -= 1
    end
  end

  result
end

matrix = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]

p traverse(matrix)





