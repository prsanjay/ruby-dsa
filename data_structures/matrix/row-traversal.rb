def traverse(matrix)
  rows = matrix.size
  cols = matrix[0].size
  result = []

  (0...rows).each do |i|
    (0...cols).each do |j|
      result << matrix[i][j]
    end
  end
  result
end



p traverse([[1,2,3], [4,5,6], [7,8,9]])