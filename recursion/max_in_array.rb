require 'pry-byebug'

# reduce the array size by 1 and find the max of remaining elements
# Time complexity is O(N)
def max_in_array(array)
  if array.size == 1
    return array[0]
  else
    max_subarray = max_in_array(array[1..-1])
    return [array[0], max_subarray].max
  end
end

#puts max_in_array([1,2,3,4])


# Solution with TC: O(nlogn)
# Approach is to divide the array in 2 halves, left and right
# And then find the max of each half and find the max of left and right max
def optimized_max_in_array(arr)
  if arr.size == 1
    arr.first
  else
    mid = arr.size / 2
    left = arr[0..mid - 1]
    right = arr[mid..-1]

    max_left = optimized_max_in_array(left)
    max_right = optimized_max_in_array(right)

    [max_left, max_right].max
  end
end

puts optimized_max_in_array([1,2,3,4])


