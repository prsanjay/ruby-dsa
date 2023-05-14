require 'pry'

def generate(num_rows)
  res = [[1]]
  rows = num_rows-1
  rows.times do |i|
    row = []
    prev = res[-1] # [1]
    (prev.length+1).times do |j|
      if j==0 || j == i
        row.push(1)
      else
        row.push(prev[j-1] + prev[j])
      end
    end
    res.push(row)
  end
  res
end

p generate(3)