require 'pry-byebug'


def combination(array, size)
  result = []
  backtrack(array, size, [], result, 0)
  result
end

def backtrack(arr, size, combination, result, start)
  if combination.length == size
    result << combination.dup
    return
  end

  (start...arr.length).each do |i|
    combination << arr[i]
    backtrack(arr, size, combination, result, i + 1)
    combination.pop # Remove the last element after the recursive call
  end
end


p combination([1,2,3], 2)
