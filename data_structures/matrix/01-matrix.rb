require "pry"

def update_matrix(mat)
  q = []
  rows = mat.size
  cols = mat[0].size
  result = Array.new(rows) { Array.new(cols)}
  visited =  Array.new(rows) { Array.new(cols)}

  (0...rows).each do |row|
    (0...cols).each do |col|
        if mat[row][col] == 0
            q.push([[row, col], 0])
            visited[row][col] = 1
        end
    end
  end
  while !q.empty?
    curr = q.shift
    dis = curr[1]
    cell = curr[0]
    newrow = cell[0]
    newcol = cell[1]
    result[newrow][newcol] = dis
    #up
    if !(newrow-1).negative? && visited[newrow-1][newcol].nil?
        q.push([[newrow-1, newcol], dis+1])
        visited[newrow-1][newcol] = 1
    end

    # down
    if !mat[newrow+1].nil? && visited[newrow+1][newcol].nil?
        q.push([[newrow+1, newcol], dis+1])
        visited[newrow+1][newcol] = 1
    end

    left = mat[newrow][newcol-1]
    if !(newcol-1).negative? && visited[newrow][newcol-1].nil?
        q.push([[newrow, newcol-1], dis+1])
        visited[newrow][newcol-1] = 1
    end
    right = mat[newrow][newcol+1]
    if !right.nil? && visited[newrow][newcol+1].nil?
        q.push([[newrow, newcol+1], dis+1])
        visited[newrow][newcol+1] = 1
    end
  end
  result
end


p update_matrix([[0,0,0],[0,1,0],[1,1,1]])