require 'pry'

# Perform BFS using Queue
def flood_fill(image, sr, sc, color)
  return if image.size.zero? || image.nil?

  queue = [[sr, sc]]
  pixel = image[sr][sc]
  rows = image.size
  cols = image[0].size
  explored = Array.new(rows) { Array.new(cols, false) }
  while !queue.empty?
    current = queue.shift
    row = current[0]
    col = current[1]
    current_pixel = image[row][col]

    next if explored[row][col] == true

    explored[row][col] = true

    image[row][col] = color if current_pixel == pixel

    topr = row-1
    if (0...rows) === topr
      top = image[row-1][col]
      if top == pixel
        image[row-1][col] = color
        queue.push([row-1, col]) if explored[row-1][col] == false
      end
    end

    bottomr = row+1
    if (0...rows) === bottomr
      bottom = image[row+1][col]
      if bottom == pixel
        image[row+1][col] = color
        queue.push([row+1, col]) if explored[row+1][col] == false
      end
    end

    leftc = col-1
    if (0...cols) === leftc
      left = image[row][col-1]
      if left == pixel
        image[row][col-1] = color
        queue.push([row, col-1]) if explored[row][col-1] == false
      end
    end

    rightc = col+1
    if (0...cols) === rightc
      right = image[row][col+1]
      if right == pixel
        image[row][col+1] = color
        queue.push([row, col+1]) if explored[row][col+1] == false
      end
    end
  end
  return image
end

# Perform DFS using recursion
def flood_fill_dfs(image, sr, sc, color)
  return image if image.size.zero? || sr > image.size || sc > image[0].size

  start_color = image[sr][sc]
  fill(image, sr, sc, start_color, color)
  image
end

def fill(image, row, col, start_color, new_color)
  # first fill the new color in up direction, then down, then left and then right

  # base condition
  return if row < 0 || col < 0 || row >= image.size || col >= image[0].size
  return if image[row][col] != start_color # the pixel value is diff than what we want to replace with
  return if image[row][col] == new_color # new color is already filled

  image[row][col] = new_color

  fill(image, row-1, col, start_color, new_color) # going UP
  fill(image, row+1, col, start_color, new_color) # going DOWN
  fill(image, row, col-1, start_color, new_color) # going LEFT
  fill(image, row, col+1, start_color, new_color) # going RIGHT
end


p flood_fill([[1,1,1],[1,1,0],[1,0,1]], 1, 1, 2)

p flood_fill_dfs([[1,1,1],[1,1,0],[1,0,1]], 1, 1, 2)