require 'pry'
require 'benchmark'

def roman_to_num(string)
  map = { 'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000 }
  # 2nd char in string should not have greater value than first character.
  # if this is true then subtract the value of 2nd char from the sum

  sum = 0
  len = string.size
  (0..len).each do |i|
    if i + 1 < len && map[string[i + 1]] > map[string[i]]
      sum -= map[string[i]]
    elsif !map[string[i]].nil?
      sum += map[string[i]]
    end
  end
  sum
end

puts roman_to_num('VI')

Benchmark.bm do |x|
  x.report { p roman_to_num('VI') }
end