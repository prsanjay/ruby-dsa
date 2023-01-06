require 'benchmark'
require 'pry'

# Brute Force Approach
def two_sum(nums, target)
  size = nums.size
  found = false
  (0...size).each do |i|
    break if found

    (i + 1...size).each do |j|
      found = true if nums[i] + nums[j] == target
      return [i, j] if found == true
    end
  end
end

Benchmark.bm do |x|
  x.report { p two_sum([1,2,3,4,5], 9)}
end

# Using hashmap
def optimized_two_sum(nums, target)
  map = {}
  nums.each_with_index do |num, index|
    temp = target - num
    if map.key?(temp)
      return [index, map[temp]]
    else
      map[num] = index
    end
  end
end

Benchmark.bm do |x|
  x.report { p optimized_two_sum([1,2,3,4,5], 9) }
end
