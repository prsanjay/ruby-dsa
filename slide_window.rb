# Find max sum of window size of k

require 'pry'
require 'benchmark'

def brute_force
  max_sum = 0
  array = Array(1..10000000)
  k = 3
  array.each_with_index do |_, index|
    window_sum = 0
    array[index...index + k].each do |j|
      window_sum += j
    end
    if window_sum > max_sum
      max_sum = window_sum
    end
  end
  puts max_sum
end

def slide_window
  array = Array(1..100000)
  size = array.size
  k = 3 # window size
  i = 0 # window start pointer
  j = 0 # window end pointer
  sum = 0 # each window sum
  max_sum = 0
  while j < size
    sum = sum + array[j] # sum of elements in window
    window_size = j - i + 1
    if window_size < k
      j = j + 1
    elsif window_size == k
      max_sum = sum
      sum = sum - array[i]
      j = j + 1
      i = i + 1
    end
  end
  puts max_sum
end

Benchmark.bm do |x|
  x.report { brute_force }
end

Benchmark.bm do |x|
  x.report { slide_window }
end